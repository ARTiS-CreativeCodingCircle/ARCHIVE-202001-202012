import processing.pdf.*;

boolean isExportPDF = true;
boolean isVisibleGrid = false;
boolean isTwoSheets = true; // 2ページを横に並べて，見開き1ページとして表示する
boolean isCover = false;

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
        textFont(createFont(TextType.section.getFontName(), 10));
        fill(0);
        textAlign(LEFT);
        text(((2*i)+1) + "  |  " + allPages.get(2*i).section.getSectionNumber() + " - " + authors, marginHorizontal, HEIGHT-marginVertical/2);
        // ページ描画
        allPages.get(2*i).draw();
        push();
        translate(WIDTH, 0);
        if ((2*i+1) != allPages.size()) {
          // ページ番号とセクションタイトル
          authors = "";
          for (Author author: allPages.get(2*i+1).section.getAuthors()) {
            if (authors != "") authors += ", ";
            authors += author.getName();
          }
          textFont(createFont(TextType.section.getFontName(), 10));
          fill(0);
          textAlign(RIGHT);
          text(allPages.get(2*i+1).section.getSectionNumber() + " - " + authors + "  |  " + ((2*i+1)+1), WIDTH-marginHorizontal, HEIGHT-marginVertical/2);
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
  if (isCover) {
    pages.add( new Cover(Section.cover) );
  }
  
  if (!isCover) {
    /* -------- まえがき -------- */
    // ページ合わせの空白ページ
    pages.add( new Page(Section.empty) );
    pages.add( new DescriptionPage(Section.foreword,
                                   txtToString(Section.foreword.getPath() + "title.txt"),
                                   txtToString(Section.foreword.getPath() + "main.txt")) );
    
    /* -------- 目次 -------- */
    pages.add( new ContentsTable(loadImage(Section.contents.getPath() + "left.png"), #000000) );
    pages.add( new ContentsTable(loadImage(Section.contents.getPath() + "right.png"), #000000) );
    
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
    pages.add( new Page(Section.empty) );
    
    /* -------- 活動アーカイブ（ロゴ）-------- */
    pages.addAll( generateActivityPages(Section.artis_logo) );
    
    /* -------- 活動アーカイブ（サイト）-------- */
    pages.addAll( generateActivityPages(Section.artis_website) );
    
    /* -------- 活動アーカイブ（作品展）-------- */
    pages.addAll( generateActivityPages(Section.artis_exhibition) );
    
    // ページ合わせの空白ページ
    pages.add( new Page(Section.empty) );
    
    /* -------- 活動アーカイブ（ワークショップ）-------- */
    pages.addAll( generateActivityPages(Section.artis_workshop) );
    
    /* -------- あとがき -------- */
    pages.add( new DescriptionPage(Section.afterword,
                                   txtToString(Section.afterword.getPath() + "title.txt"),
                                   txtToString(Section.afterword.getPath() + "main.txt")) );
  }
  
  /* -------- 裏表紙 -------- */
  if (isCover) {
    pages.add( new BackCover(Section.backcover) );
  }
  
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
