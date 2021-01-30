import processing.pdf.*;

boolean isExportPDF = true;
boolean isVisibleGrid = false;
boolean isTwoSheets = true; // 2ページを横に並べて，見開き1ページとして表示する

PImage grid;
ArrayList<Page> allPages;

// 上下（垂直：Vertical）と左右（水平：Horizontal）のマージン
int marginVertical = 74; // (72dpi) 26.2mm = 74px
int marginHorizontal = 68; // (72dpi) 24mm = 68px
int titleBottomPadding = 56;
int mainTopPadding = 12;

// マージンを除く描画エリア
int areaWidth;
int areaHeight;

// 1枚のサイズ (A4, 72dpi)
final float WIDTH = 595.0;
final float HEIGHT = 842.0;

void settings() {
  if (isTwoSheets) {
    size(int(WIDTH)*2, int(HEIGHT));
  } else {
    size(int(WIDTH), int(HEIGHT));
  }
}

void setup() {
  textAlign(LEFT, TOP);
  
  areaWidth = int(WIDTH - marginHorizontal*2);
  areaHeight = int(HEIGHT - marginVertical*2);
  
  grid = loadImage("grid.png");
  allPages = generatePages();
  
  int pageNumber = 1;
  
  if (isExportPDF) {
    if (isTwoSheets) {
      int pageCount = (allPages.size()+1)/2;
      for (int i = 0; i < pageCount; i++) {
        beginRecord(PDF, "output/Page" + i + ".pdf");
        background(255);
        // ページ番号とセクションタイトル
        String authors = "";
        for (Author author: allPages.get(2*i).section.getAuthors()) {
          if (authors != "") authors += ", ";
          authors += author.getName();
        }
        // ページ番号描画
        switch (allPages.get(2*i).section) {
          case foreword:
          case contents:
          case afterword:
          case cover:
          case backcover:
          case colophon:
              // 表紙／裏表紙，まえがき，目次，あとがき，奥付ではページ番号を表示しない
            break;
          default:
            textFont(createFont(TextType.section.getFontName(), 10));
            fill(0);
            textAlign(LEFT);
            text(pageNumber + "  |  " + allPages.get(2*i).section.getSectionNumber() + " - " + authors, marginHorizontal, HEIGHT-marginVertical/2);
            pageNumber++;
        }
        // 左ページ描画
        allPages.get(2*i).draw();
        
        push();
        translate(WIDTH, 0);
        // 右ページが存在するとき
        if ((2*i+1) != allPages.size()) {
          // ページ番号とセクションタイトル
          authors = "";
          for (Author author: allPages.get(2*i+1).section.getAuthors()) {
            if (authors != "") authors += ", ";
            authors += author.getName();
          }
          // 右ページ番号描画
          switch (allPages.get(2*i+1).section) {
            case foreword:
            case contents:
            case afterword:
            case cover:
            case backcover:
            case colophon:
              // 表紙／裏表紙，まえがき，目次，あとがき，奥付ではページ番号を表示しない
              break;
            default:
              textFont(createFont(TextType.section.getFontName(), 10));
              fill(0);
              textAlign(RIGHT);
              text(allPages.get(2*i+1).section.getSectionNumber() + " - " + authors + "  |  " + pageNumber, WIDTH-marginHorizontal, HEIGHT-marginVertical/2);
              pageNumber++;
          }
          // 右ページ描画
          allPages.get(2*i+1).draw();
        }
        stroke(200, 50);
        line(0, 0, 0, HEIGHT);
        pop();
        endRecord();
        clear();
      }
    } else {
      for (int i = 0; i < allPages.size(); i++) {
        beginRecord(PDF, "output/Page" + i + ".pdf");
        background(255);
        allPages.get(i).draw();
        endRecord();
        clear();
      }
    }
  }
  exit();
}



ArrayList<Page> generatePages() {
  
  ArrayList<Page> pages = new ArrayList<Page>();
  
  /* -------- 表紙 -------- */
  pages.add( new Cover(Section.cover) );
  
  /* -------- まえがき -------- */
  pages.add( new DescriptionPage(Section.foreword,
                                 txtToString(Section.foreword.getPath() + "title.txt"),
                                 txtToString(Section.foreword.getPath() + "main.txt")) );
  
  /* -------- 目次 -------- */
  pages.add( new ContentsTable(loadImage(Section.contents.getPath() + "left.png"), #000000) );
  pages.add( new ContentsTable(loadImage(Section.contents.getPath() + "right.png"), #000000) );
  
  pages.add( new Page(Section.empty) );
  
  /* -------- 個人作品の章表紙 -------- */
  String worksPath = Section.works_cover.getPath() + "description.txt";
  PGraphics worksBack = createGraphics(595, 842);
  worksBack.beginDraw();
  worksBack.background(#500000);
  worksBack.endDraw();
  pages.add( new SectionCover(Section.works_cover, worksBack, txtToString(worksPath), color(#FFFFFF)) );
  
  /* -------- 個人作品（ohayota） -------- */
  pages.addAll( generatePersonalCover(Section.works_ohayota_cover, color(#000000), null) ); // ohayota個人表紙
  pages.addAll( generatePersonalWorks(Section.works_ohayota) ); // ohayota個人作品ページ
  
  /* -------- 個人作品（Tomoka） -------- */
  pages.addAll( generatePersonalCover(Section.works_tomoka_cover, color(#FFFFFF), null) ); // Tomoka個人表紙
  pages.addAll( generatePersonalWorks(Section.works_tomoka) ); // Tomoka個人作品ページ
  
  /* -------- 個人作品（Ikanoshiokara） -------- */
  pages.addAll( generatePersonalCover(Section.works_ikano_cover, color(#00B0F0),
                                      new ClearRect[] { new ClearRect(82, 594, int(WIDTH-82*2), 132, color(#FFFFFF, 200)),
                                                        new ClearRect(82, 232, int(HEIGHT-82*2), 129, color(#FFFFFF, 200)) }) ); // Ikanoshiokara個人表紙
  pages.addAll( generatePersonalWorks(Section.works_ikano) ); // Ikanoshiokara個人作品ページ
  
  /* -------- 個人作品（あきっち） -------- */
  pages.addAll( generatePersonalCover(Section.works_akitch_cover, color(#FFFFFF),
                                      new ClearRect[] { new ClearRect(82, 594, int(WIDTH-82*2), 88, color(#000000, 120)) }) ); // あきっち個人表紙
  pages.addAll( generatePersonalWorks(Section.works_akitch) ); // あきっち個人作品ページ
  
  /* -------- 個人作品（eboshidori） -------- */
  pages.addAll( generatePersonalCover(Section.works_eboshi_cover, color(#FFFFFF), null) ); // eboshidori個人表紙
  pages.addAll( generatePersonalWorks(Section.works_eboshi) ); // eboshidori個人作品ページ
  
  // ページ合わせの空白ページ
  //pages.add( new Page(Section.empty) );
  
  /* -------- 活動アーカイブの章表紙 -------- */
  String activityPath = Section.artis_activity_cover.getPath() + "description.txt";
  PGraphics activityBack = createGraphics(595, 842);
  activityBack.beginDraw();
  activityBack.background(#500000);
  activityBack.endDraw();
  pages.add( new SectionCover(Section.artis_activity_cover, activityBack, txtToString(activityPath), color(#FFFFFF)) );
  
  /* -------- 活動アーカイブ（ロゴ）-------- */
  pages.addAll( generateActivityPages(Section.artis_logo) );
  
  /* -------- 活動アーカイブ（サイト）-------- */
  pages.addAll( generateActivityPages(Section.artis_website) );
  
  /* -------- 活動アーカイブ（作品展）の節表紙 -------- */
  String exhibitionPath = Section.artis_exhibition_cover.getPath() + "description.txt";
  PGraphics exhibitionBack = createGraphics(595, 842);
  exhibitionBack.beginDraw();
  exhibitionBack.background(#500000);
  exhibitionBack.endDraw();
  pages.add( new SectionCover(Section.artis_exhibition_cover, exhibitionBack, txtToString(exhibitionPath), color(#FFFFFF)) );
  
  /* -------- 活動アーカイブ（作品展）-------- */
  pages.addAll( generateActivityPages(Section.artis_exhibition) );
  
  /* -------- 活動アーカイブ（ワークショップ）の節表紙 -------- */
  String workshopPath = Section.artis_workshop_cover.getPath() + "description.txt";
  PGraphics workshopBack = createGraphics(595, 842);
  workshopBack.beginDraw();
  workshopBack.background(#500000);
  workshopBack.endDraw();
  pages.add( new SectionCover(Section.artis_workshop_cover, workshopBack, txtToString(workshopPath), color(#FFFFFF)) );
  
  /* -------- 活動アーカイブ（ワークショップ）-------- */
  pages.addAll( generateActivityPages(Section.artis_workshop) );
  
  /* -------- あとがき -------- */
  pages.add( new AfterwordPage() );
  
  /* -------- 奥付 -------- */
  pages.add( new DescriptionPage(Section.colophon,
                                 txtToString(Section.colophon.getPath() + "title.txt"),
                                 txtToString(Section.colophon.getPath() + "main.txt")) );
  
  /* -------- 裏表紙 -------- */
  pages.add( new BackCover(Section.backcover) );
  
  return pages;
}

String txtToString(String path) {
  String text = "";
  String[] lines = loadStrings(path);
  for (int i = 0 ; i < lines.length; i++) {
    text += lines[i] + "\n";
  }
  return text;
}

int convertImageWidth(PImage image, float afterImageHeight) {
  float afterImageWidth = image.width*(afterImageHeight/(float)image.height);
  return int(afterImageWidth);
}

int convertImageHeight(PImage image, float afterImageWidth) {
  float afterImageHeight = image.height*(afterImageWidth/(float)image.width);
  return int(afterImageHeight);
}
