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
}

void draw() {
  if (isExportPDF) {
    beginRecord(PDF, "Page.pdf");
    PersonalCoverRight pL = new PersonalCoverRight(loadImage("Silk_freesize_01.png"));
    pL.draw();
    endRecord();
    clear();
    beginRecord(PDF, "Page.pdf");
    PersonalCoverRight pR = new PersonalCoverRight(loadImage("Silk_freesize_02.png"));
    pR.draw();
    endRecord();
    exit();
  } else {
    //Page p = new Page(images);
    //p.draw();
  }
}
