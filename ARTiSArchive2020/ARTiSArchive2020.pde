import processing.pdf.*;

boolean isExportPDF = true;
boolean isVisibleGrid = true;

PFont notoSansCjkJp;
PFont notoSerifCjkJp;
PFont notoMono;

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
  
  // フォント3種類を読み込む
  notoSansCjkJp = createFont("NotoSansCJKjp-Regular", 48);
  notoSerifCjkJp = createFont("NotoSerifCJKjp-Regular", 48);
  notoMono = createFont("NotoMono", 48);
  
  areaWidth = width - marginHorizontal*2;
  areaHeight = height - marginVertical*2;
  
  grid = loadImage("grid.png");
  
  pages = new ArrayList<Page>(); // これ以降はページをここに追加していく
}

void draw() {
  if (isExportPDF) {
    beginRecord(PDF, "Page.pdf");
    Page p = new Page();
    p.draw();
    endRecord();
  }
  exit();
}
