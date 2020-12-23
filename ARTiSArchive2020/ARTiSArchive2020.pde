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
  // ohayota個人表紙左
  PersonalCoverLeft pL = new PersonalCoverLeft(loadImage("Silk_freesize_01.png"));
  pages.add(pL);
  
  // ohayota個人表紙右
  String text = "線で構成されるものが好きです。\n複雑で繊細な構造と、不確実性に惹かれます。\nネイティブ言語はProcessing、第一外国語は日本語。\nARTiSの代表。プログラムアートに興味を持つ人を増やしたい。";
  PersonalCoverRight pR = new PersonalCoverRight(Author.ohayota, loadImage("Silk_freesize_02.png"), text);
  pages.add(pR);
}

void draw() {
  if (isExportPDF) {
    beginRecord(PDF, "output/Page1.pdf");
    background(255);
    pages.get(0).draw();
    endRecord();
    clear();
    beginRecord(PDF, "output/Page2.pdf");
    background(255);
    pages.get(1).draw();
    endRecord();
    exit();
  } else {
    //Page p = new Page(images);
    //p.draw();
  }
}
