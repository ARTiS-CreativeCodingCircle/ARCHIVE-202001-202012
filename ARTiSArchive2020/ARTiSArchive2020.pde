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
  background(255);
  
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
  PersonalCoverRight pR = new PersonalCoverRight(Author.ohayota, loadImage("Silk_freesize_02.png"));
  pages.add(pR);
}

void draw() {
  if (isExportPDF) {
    beginRecord(PDF, "Page1.pdf");
    pages.get(0).draw();
    endRecord();
    clear();
    beginRecord(PDF, "Page2.pdf");
    pages.get(1).draw();
    endRecord();
    exit();
  } else {
    //Page p = new Page(images);
    //p.draw();
  }
}
