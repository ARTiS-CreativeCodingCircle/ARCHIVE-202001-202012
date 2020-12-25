import processing.pdf.*;

boolean isExportPDF = true;
boolean isVisibleGrid = true;

PImage grid;
ArrayList<Page> allPages;

// 上下（垂直：Vertical）と左右（水平：Horizontal）のマージン
int marginVertical = 74; // (72dpi) 26.2mm = 74px
int marginHorizontal = 68; // (72dpi) 24mm = 68px
int titleBottomPadding = 56;

// マージンを除く描画エリア
int areaWidth;
int areaHeight;

void setup() {
  size(595, 842); // Screen: A4 72dpi
  
  textAlign(LEFT, TOP);
  
  areaWidth = width - marginHorizontal*2;
  areaHeight = height - marginVertical*2;
  
  grid = loadImage("grid.png");
  allPages = generatePages();
  
  if (isExportPDF) {
    for (int i = 0; i < allPages.size(); i++) {
      beginRecord(PDF, "output/Page" + i + ".pdf");
      background(255);
      allPages.get(i).draw();
      endRecord();
      clear();
    }
  }
  exit();
}



ArrayList<Page> generatePages() {
  
  ArrayList<Page> pages = new ArrayList<Page>();
  
  /* -------- 表紙 -------- */
  
  
  /* -------- まえがき -------- */
  
  
  /* -------- 目次 -------- */
  
  
  /* -------- 個人作品（ohayota） -------- */
  pages.addAll( generatePersonalCover(Section.works_ohayota_cover) ); // ohayota個人表紙
  pages.addAll( generatePersonalWorks(Section.works_ohayota) ); // ohayota個人作品ページ
  
  /* -------- 個人作品（Tomoka） -------- */
  pages.addAll( generatePersonalCover(Section.works_tomoka_cover) ); // Tomoka個人表紙
  pages.addAll( generatePersonalWorks(Section.works_tomoka) ); // Tomoka個人作品ページ
  
  /* -------- 個人作品（Ikanoshiokara） -------- */
  pages.addAll( generatePersonalCover(Section.works_ikano_cover) ); // Ikanoshiokara個人表紙
  pages.addAll( generatePersonalWorks(Section.works_ikano) ); // Ikanoshiokara個人作品ページ
  
  /* -------- 個人作品（あきっち） -------- */
  pages.addAll( generatePersonalCover(Section.works_akitch_cover) ); // あきっち個人表紙
  pages.addAll( generatePersonalWorks(Section.works_akitch) ); // あきっち個人作品ページ
  
  /* -------- 個人作品（eboshidori） -------- */
  pages.addAll( generatePersonalCover(Section.works_eboshi_cover) ); // eboshidori個人表紙
  pages.addAll( generatePersonalWorks(Section.works_eboshi) ); // eboshidori個人作品ページ
  
  /* -------- 活動アーカイブ（ロゴ）-------- */
  generateActivityPages(Section.artis_logo);
  
  /* -------- 活動アーカイブ（サイト）-------- */
  generateActivityPages(Section.artis_website);
  
  /* -------- 活動アーカイブ（作品展）-------- */
  generateActivityPages(Section.artis_exhibition);
  
  /* -------- 活動アーカイブ（ワークショップ）-------- */
  generateActivityPages(Section.artis_workshop);
  
  /* -------- あとがき -------- */
  
  
  /* -------- 裏表紙 -------- */
  
  
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
