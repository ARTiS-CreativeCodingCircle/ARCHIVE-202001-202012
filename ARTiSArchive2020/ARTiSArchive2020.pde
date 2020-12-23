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
  PersonalCoverLeft pL = new PersonalCoverLeft(loadImage(Section.works_ohayota_cover.getPath() + "left.png"));
  pages.add(pL);
  
  // ohayota個人表紙右
  String path = Section.works_ohayota_cover.getPath() + "selfintro.txt";
  PersonalCoverRight pR = new PersonalCoverRight(Author.ohayota, loadImage(Section.works_ohayota_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
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
