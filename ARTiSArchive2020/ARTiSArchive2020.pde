import processing.pdf.*;

boolean isExportPDF = true;
boolean isVisibleGrid = true;

PImage grid;

ArrayList<Page> pages;

// 上下（垂直：Vertical）と左右（水平：Horizontal）のマージン
int marginVertical = 74; // (72dpi) 26.2mm = 74px
int marginHorizontal = 68; // (72dpi) 24mm = 68px

// マージンを除く描画エリア
int areaWidth;
int areaHeight;

void setup() {
  size(595, 842); // Screen: 72dpi
  
  textAlign(LEFT, TOP);
  
  areaWidth = width - marginHorizontal*2;
  areaHeight = height - marginVertical*2;
  
  grid = loadImage("grid.png");
  
  pages = new ArrayList<Page>(); // これ以降はページをここに追加していく
  
  generatePages();
}

void generatePages() {
  String path = "";
  PersonalCoverLeft pL;
  PersonalCoverRight pR;
  Page p;
  
  /* -------- 表紙 -------- */
  
  
  /* -------- まえがき -------- */
  
  
  /* -------- 目次 -------- */
  
  
  /* -------- 個人作品（ohayota） -------- */
  
  // ohayota個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_ohayota_cover.getPath() + "left.png"));
  pages.add(pL);
  // ohayota個人表紙右
  path = Section.works_ohayota_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.ohayota, loadImage(Section.works_ohayota_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  // ジェネラティブトランプ見開き1ページ
  p = new DescriptionPage(txtToString(Section.works_ohayota.getPath() + "generative/title.txt"),
                          txtToString(Section.works_ohayota.getPath() + "generative/main.txt"));
  pages.add(p);
  p = new LargeImagePage(loadImage(Section.works_ohayota.getPath() + "generative/image.png"));
  pages.add(p);
  
  
  /* -------- 個人作品（Tomoka） -------- */
  
  // Tomoka個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_tomoka_cover.getPath() + "left.png"));
  pages.add(pL);
  // Tomoka個人表紙右
  path = Section.works_tomoka_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.tomoka, loadImage(Section.works_tomoka_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  //p = new Page();
  //pages.add(p);
  
  
  /* -------- 個人作品（Ikanoshiokara） -------- */
  
  // Ikanoshiokara個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_ikano_cover.getPath() + "left.png"));
  pages.add(pL);
  // Ikanoshiokara個人表紙右
  path = Section.works_ikano_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.ikano, loadImage(Section.works_ikano_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  //p = new Page();
  //pages.add(p);
  
  
  /* -------- 個人作品（あきっち） -------- */
  
  // あきっち個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_akitch_cover.getPath() + "left.png"));
  pages.add(pL);
  // あきっち個人表紙右
  path = Section.works_akitch_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.akitch, loadImage(Section.works_akitch_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  //p = new Page();
  //pages.add(p);
  
  
  /* -------- 個人作品（eboshidori） -------- */
  
  // eboshidori個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_eboshi_cover.getPath() + "left.png"));
  pages.add(pL);
  // eboshidori個人表紙右
  path = Section.works_eboshi_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.eboshi, loadImage(Section.works_eboshi_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  //p = new Page();
  //pages.add(p);
  
  
  /* -------- 活動アーカイブ（ロゴ）-------- */
  
  //p = new Page();
  //pages.add(p);
  
  
  /* -------- 活動アーカイブ（サイト）-------- */
  
  //p = new Page();
  //pages.add(p);
  
  
  /* -------- 活動アーカイブ（作品展）-------- */
  
  //p = new Page();
  //pages.add(p);
  
  
  /* -------- あとがき -------- */
  
  //p = new Page();
  //pages.add(p);
  
  
  /* -------- 裏表紙 -------- */
}

String txtToString(String path) {
  String text = "";
  String[] lines = loadStrings(path);
  for (int i = 0 ; i < lines.length; i++) {
    text += lines[i] + "\n";
  }
  return text;
}

void draw() {
  if (isExportPDF) {
    for (int i = 0; i < pages.size(); i++) {
      beginRecord(PDF, "output/Page" + i + ".pdf");
      background(255);
      pages.get(i).draw();
      endRecord();
      clear();
    }
    exit();
  }
}
