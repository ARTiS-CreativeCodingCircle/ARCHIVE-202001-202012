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

ArrayList<Page> generatePersonalCover(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  // 個人表紙左
  Page pL = new PersonalCoverLeft(loadImage(section.getPath() + "left.png"));
  pages.add(pL);
  // 個人表紙右
  String path = section.getPath() + "selfintro.txt";
  Page pR = new PersonalCoverRight(Author.ohayota, loadImage(section.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  return pages;
}

void generatePages() {
  Section section;
  String path = "";
  PersonalCoverLeft pL;
  PersonalCoverRight pR;
  Page p;
  PImage img;
  PImage img1;
  PImage img2;
  PImage img3;
  PImage img4;
  PImage img5;
  PImage img6;
  PImage img7;
  PImage img8;
  PImage img9;
  PImage img10;
  PImage img11;
  PImage img12;
  
  /* -------- 表紙 -------- */
  
  
  /* -------- まえがき -------- */
  
  
  /* -------- 目次 -------- */
  
  
  /* -------- 個人作品（ohayota） -------- */
  
  // ohayota個人表紙
  section = Section.works_ohayota_cover; 
  pages.addAll(generatePersonalCover(section));
  
  section = Section.works_ohayota;
  
  // ジェネラティブトランプ見開き1ページ
  p = new DescriptionPage(txtToString(section.getPath() + "generative/title.txt"),
                          txtToString(section.getPath() + "generative/main.txt"),
                          new CodeBlock(txtToString(section.getPath() + "generative/code.txt"),
                                        marginHorizontal, 262, int(areaWidth*(1.99/3.0)), areaHeight-(262-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "generative/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 262, int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)));
  pages.add(p);
  p = new LargeImagePage(loadImage(section.getPath() + "generative/image.png"));
  pages.add(p);
  
  // Glass Planet
  img1 = loadImage(section.getPath() + "glass/image1.png");
  img2 = loadImage(section.getPath() + "glass/image2.png");
  p = new DescriptionPage(txtToString(section.getPath() + "glass/title.txt"),
                          txtToString(section.getPath() + "glass/main.txt"),
                          marginVertical+56 + int(img1.height*(areaWidth/(float)img1.width)) + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56, areaWidth, int(img1.height*(areaWidth/(float)img1.width))),
                                       new Image(img2, marginHorizontal, height-marginVertical-int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width)),
                                                 int(areaWidth*(1.99/3.0)), int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width))) },
                          new SmallTextBlock(txtToString(Section.works_ohayota.getPath() + "glass/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), height-marginVertical-int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width)),
                                             int(areaWidth*(0.99/3.0)), int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width))));
  pages.add(p);
  
  // Silk
  img1 = loadImage(section.getPath() + "silk/image1.png");
  img2 = loadImage(section.getPath() + "silk/image2.png");
  p = new DescriptionPage(txtToString(section.getPath() + "silk/title.txt"),
                          txtToString(section.getPath() + "silk/main.txt"),
                          marginVertical+56 + int(img1.height*(areaWidth/(float)img1.width)) + 16,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56, areaWidth, int(img1.height*(areaWidth/(float)img1.width))),
                                       new Image(img2, marginHorizontal, height-marginVertical-int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width)),
                                                 int(areaWidth*(1.99/3.0)), int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width))) },
                          new SmallTextBlock(txtToString(Section.works_ohayota.getPath() + "silk/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), height-marginVertical-int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width)),
                                             int(areaWidth*(0.99/3.0)), int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width))));
  pages.add(p);
  
  // Clear Triangle & Cyan and Magenta
  img1 = loadImage(section.getPath() + "clear/image1.png");
  img2 = loadImage(section.getPath() + "clear/image2.png");
  p = new DescriptionPage(txtToString(section.getPath() + "clear/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.01/3.0)), height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))) },
                          new TextBlock[] { new SmallTextBlock(txtToString(section.getPath() + "clear/small1.txt"),
                                                                    width-marginHorizontal-int(areaWidth*(0.99/3.0)), marginVertical+56,
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)),
                                            new SmallTextBlock(txtToString(section.getPath() + "clear/small2.txt"),
                                                               marginHorizontal, height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                               int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)) });
  pages.add(p);
  
  // Flag
  img1 = loadImage(section.getPath() + "flag/image1.png");
  img2 = loadImage(section.getPath() + "flag/image2.png");
  img3 = loadImage(section.getPath() + "flag/image3.png");
  img4 = loadImage(section.getPath() + "flag/image4.png");
  img5 = loadImage(section.getPath() + "flag/image5.png");
  img6 = loadImage(section.getPath() + "flag/image6.png");
  img7 = loadImage(section.getPath() + "flag/image7.png");
  img8 = loadImage(section.getPath() + "flag/image8.png");
  p = new DescriptionPage(txtToString(section.getPath() + "flag/title.txt"),
                          txtToString(section.getPath() + "flag/main.txt"),
                          new Image[]{ new Image(img1, marginHorizontal,
                                                 marginVertical+56+148,
                                                 int(areaWidth*(0.985/2.0)), int(img1.height*(areaWidth*(0.985/2.0)/(float)img1.width))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.015/2.0)),
                                                 marginVertical+56+148,
                                                 int(areaWidth*(0.985/2.0)), int(img1.height*(areaWidth*(0.985/2.0)/(float)img1.width))),
                                       new Image(img3, marginHorizontal,
                                                 marginVertical+56+148 + int(img1.height*(areaWidth*(1.015/2.0)/(float)img1.width)),
                                                 int(areaWidth*(0.985/2.0)), int(img1.height*(areaWidth*(0.985/2.0)/(float)img1.width))),
                                       new Image(img4, marginHorizontal+int(areaWidth*(1.015/2.0)),
                                                 marginVertical+56+148 + int(img1.height*(areaWidth*(1.015/2.0)/(float)img1.width)),
                                                 int(areaWidth*(0.985/2.0)), int(img1.height*(areaWidth*(0.985/2.0)/(float)img1.width))),
                                       new Image(img5, marginHorizontal,
                                                 marginVertical+56+148 + 2*int(img1.height*(areaWidth*(1.015/2.0)/(float)img1.width)),
                                                 int(areaWidth*(0.985/2.0)), int(img1.height*(areaWidth*(0.985/2.0)/(float)img1.width))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(1.015/2.0)),
                                                 marginVertical+56+148 + 2*int(img1.height*(areaWidth*(1.015/2.0)/(float)img1.width)),
                                                 int(areaWidth*(0.985/2.0)), int(img1.height*(areaWidth*(0.985/2.0)/(float)img1.width))),
                                       new Image(img7, marginHorizontal,
                                                 marginVertical+56+148 + 3*int(img1.height*(areaWidth*(1.015/2.0)/(float)img1.width)),
                                                 int(areaWidth*(0.985/2.0)), int(img1.height*(areaWidth*(0.985/2.0)/(float)img1.width))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.015/2.0)),
                                                 marginVertical+56+148 + 3*int(img1.height*(areaWidth*(1.015/2.0)/(float)img1.width)),
                                                 int(areaWidth*(0.985/2.0)), int(img1.height*(areaWidth*(0.985/2.0)/(float)img1.width))) },
                          new SmallTextBlock(txtToString(section.getPath() + "flag/small.txt"),
                                             marginHorizontal, height-marginVertical-24,
                                             areaWidth, 32));
  pages.add(p);
  
  // Prism Scope
  img1 = loadImage(section.getPath() + "prism/image1.png");
  img2 = loadImage(section.getPath() + "prism/image2.png");
  img3 = loadImage(section.getPath() + "prism/image3.png");
  img4 = loadImage(section.getPath() + "prism/image4.png");
  img5 = loadImage(section.getPath() + "prism/image5.png");
  img6 = loadImage(section.getPath() + "prism/image6.png");
  img7 = loadImage(section.getPath() + "prism/image7.png");
  img8 = loadImage(section.getPath() + "prism/image8.png");
  img9 = loadImage(section.getPath() + "prism/image9.png");
  img10 = loadImage(section.getPath() + "prism/image10.png");
  img11 = loadImage(section.getPath() + "prism/image11.png");
  img12 = loadImage(section.getPath() + "prism/image12.png");
  p = new DescriptionPage(txtToString(section.getPath() + "prism/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img10, marginHorizontal, marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img11, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img12, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0)))},
                          new SmallTextBlock(txtToString(section.getPath() + "prism/small.txt"),
                                                         marginHorizontal, height-marginVertical-24,
                                                         areaWidth, 32));
  pages.add(p);
  
  // Prism Scope (Overwrite)
  img1 = loadImage(section.getPath() + "prism_over/image1.png");
  img2 = loadImage(section.getPath() + "prism_over/image2.png");
  img3 = loadImage(section.getPath() + "prism_over/image3.png");
  img4 = loadImage(section.getPath() + "prism_over/image4.png");
  img5 = loadImage(section.getPath() + "prism_over/image5.png");
  img6 = loadImage(section.getPath() + "prism_over/image6.png");
  img7 = loadImage(section.getPath() + "prism_over/image7.png");
  img8 = loadImage(section.getPath() + "prism_over/image8.png");
  img9 = loadImage(section.getPath() + "prism_over/image9.png");
  img10 = loadImage(section.getPath() + "prism_over/image10.png");
  img11 = loadImage(section.getPath() + "prism_over/image11.png");
  img12 = loadImage(section.getPath() + "prism_over/image12.png");
  p = new DescriptionPage(txtToString(section.getPath() + "prism_over/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img10, marginHorizontal, marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img11, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img12, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0)))},
                          new SmallTextBlock(txtToString(section.getPath() + "prism_over/small.txt"),
                                                         marginHorizontal, height-marginVertical-24,
                                                         areaWidth, 32));
  pages.add(p);
  
  // 遠ざかる
  img1 = loadImage(section.getPath() + "goaway/image1.png");
  img2 = loadImage(section.getPath() + "goaway/image2.png");
  img3 = loadImage(section.getPath() + "goaway/image3.png");
  img4 = loadImage(section.getPath() + "goaway/image4.png");
  img5 = loadImage(section.getPath() + "goaway/image5.png");
  img6 = loadImage(section.getPath() + "goaway/image6.png");
  img7 = loadImage(section.getPath() + "goaway/image7.png");
  img8 = loadImage(section.getPath() + "goaway/image8.png");
  img9 = loadImage(section.getPath() + "goaway/image9.png");
  img10 = loadImage(section.getPath() + "goaway/image10.png");
  img11 = loadImage(section.getPath() + "goaway/image11.png");
  img12 = loadImage(section.getPath() + "goaway/image12.png");
  p = new DescriptionPage(txtToString(section.getPath() + "goaway/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img10, marginHorizontal, marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img11, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img12, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0)))},
                          new SmallTextBlock(txtToString(section.getPath() + "goaway/small.txt"),
                                                         marginHorizontal, height-marginVertical-24,
                                                         areaWidth, 32));
  pages.add(p);
  
  // リアルタイム
  img1 = loadImage(section.getPath() + "real/image1.png");
  img2 = loadImage(section.getPath() + "real/image2.png");
  img3 = loadImage(section.getPath() + "real/image3.png");
  img4 = loadImage(section.getPath() + "real/image4.png");
  img5 = loadImage(section.getPath() + "real/image5.png");
  img6 = loadImage(section.getPath() + "real/image6.png");
  img7 = loadImage(section.getPath() + "real/image7.png");
  img8 = loadImage(section.getPath() + "real/image8.png");
  img9 = loadImage(section.getPath() + "real/image9.png");
  img10 = loadImage(section.getPath() + "real/image10.png");
  img11 = loadImage(section.getPath() + "real/image11.png");
  img12 = loadImage(section.getPath() + "real/image12.png");
  p = new DescriptionPage(txtToString(section.getPath() + "real/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img10, marginHorizontal, marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img11, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img12, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0)))},
                          new SmallTextBlock(txtToString(section.getPath() + "real/small.txt"),
                                                         marginHorizontal, height-marginVertical-24,
                                                         areaWidth, 32));
  pages.add(p);
  
  // 破裂
  img1 = loadImage(section.getPath() + "rupture/image1.png");
  img2 = loadImage(section.getPath() + "rupture/image2.png");
  img3 = loadImage(section.getPath() + "rupture/image3.png");
  img4 = loadImage(section.getPath() + "rupture/image4.png");
  img5 = loadImage(section.getPath() + "rupture/image5.png");
  img6 = loadImage(section.getPath() + "rupture/image6.png");
  img7 = loadImage(section.getPath() + "rupture/image7.png");
  img8 = loadImage(section.getPath() + "rupture/image8.png");
  img9 = loadImage(section.getPath() + "rupture/image9.png");
  img10 = loadImage(section.getPath() + "rupture/image10.png");
  img11 = loadImage(section.getPath() + "rupture/image11.png");
  img12 = loadImage(section.getPath() + "rupture/image12.png");
  p = new DescriptionPage(txtToString(section.getPath() + "rupture/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img10, marginHorizontal, marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img11, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img12, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0)))},
                          new SmallTextBlock(txtToString(section.getPath() + "rupture/small.txt"),
                                                         marginHorizontal, height-marginVertical-24,
                                                         areaWidth, 32));
  pages.add(p);
  
  // 虹吹雪
  img1 = loadImage(section.getPath() + "rainbow/image1.png");
  img2 = loadImage(section.getPath() + "rainbow/image2.png");
  img3 = loadImage(section.getPath() + "rainbow/image3.png");
  img4 = loadImage(section.getPath() + "rainbow/image4.png");
  img5 = loadImage(section.getPath() + "rainbow/image5.png");
  img6 = loadImage(section.getPath() + "rainbow/image6.png");
  img7 = loadImage(section.getPath() + "rainbow/image7.png");
  img8 = loadImage(section.getPath() + "rainbow/image8.png");
  img9 = loadImage(section.getPath() + "rainbow/image9.png");
  img10 = loadImage(section.getPath() + "rainbow/image10.png");
  img11 = loadImage(section.getPath() + "rainbow/image11.png");
  img12 = loadImage(section.getPath() + "rainbow/image12.png");
  p = new DescriptionPage(txtToString(section.getPath() + "rainbow/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img10, marginHorizontal, marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img11, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img12, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0)))},
                          new SmallTextBlock(txtToString(section.getPath() + "rainbow/small.txt"),
                                                         marginHorizontal, height-marginVertical-24,
                                                         areaWidth, 32));
  pages.add(p);
  
  // DIFFERENCE
  img1 = loadImage(section.getPath() + "diff/image1.png");
  img2 = loadImage(section.getPath() + "diff/image2.png");
  img3 = loadImage(section.getPath() + "diff/image3.png");
  img4 = loadImage(section.getPath() + "diff/image4.png");
  img5 = loadImage(section.getPath() + "diff/image5.png");
  img6 = loadImage(section.getPath() + "diff/image6.png");
  img7 = loadImage(section.getPath() + "diff/image7.png");
  img8 = loadImage(section.getPath() + "diff/image8.png");
  img9 = loadImage(section.getPath() + "diff/image9.png");
  img10 = loadImage(section.getPath() + "diff/image10.png");
  img11 = loadImage(section.getPath() + "diff/image11.png");
  img12 = loadImage(section.getPath() + "diff/image12.png");
  p = new DescriptionPage(txtToString(section.getPath() + "diff/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img10, marginHorizontal, marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img11, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img12, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0)))},
                          new SmallTextBlock(txtToString(section.getPath() + "diff/small.txt"),
                                                         marginHorizontal, height-marginVertical-24,
                                                         areaWidth, 32));
  pages.add(p);
  
  // 今日と過去の風
  img1 = loadImage(section.getPath() + "wind/image1.png");
  img2 = loadImage(section.getPath() + "wind/image2.png");
  img3 = loadImage(section.getPath() + "wind/image3.png");
  p = new DescriptionPage(txtToString(section.getPath() + "wind/title.txt"),
                          txtToString(section.getPath() + "wind/main.txt"),
                          new Image[]{ new Image(img1, marginHorizontal+int(areaWidth*(1.01/3.0)),
                                                 marginVertical+56 + 104,
                                                 int(areaWidth*(1.99/3.0)), int(img1.height*(areaWidth*(1.99/3.0)/(float)img1.width))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.01/3.0)),
                                                 marginVertical+56 + 104 + int(img1.height*(areaWidth*(2.11/3.0)/(float)img1.width)),
                                                 int(areaWidth*(1.99/3.0)), int(img1.height*(areaWidth*(1.99/3.0)/(float)img1.width))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(1.01/3.0)),
                                                 marginVertical+56 + 104 + 2*int(img1.height*(areaWidth*(2.11/3.0)/(float)img1.width)),
                                                 int(areaWidth*(1.99/3.0)), int(img1.height*(areaWidth*(1.99/3.0)/(float)img1.width))) },
                          new TextBlock[] { new SmallTextBlock(txtToString(section.getPath() + "wind/small1.txt"),
                                                               marginHorizontal,
                                                               marginVertical+56 + 104,
                                                               int(areaWidth*(0.99/3.0)), int(img1.height*(areaWidth*(1.99/3.0)/(float)img1.width))),
                                            new SmallTextBlock(txtToString(section.getPath() + "wind/small2.txt"),
                                                               marginHorizontal,
                                                               marginVertical+56 + 104 + int(img1.height*(areaWidth*(2.11/3.0)/(float)img1.width)),
                                                               int(areaWidth*(0.99/3.0)), int(img1.height*(areaWidth*(1.99/3.0)/(float)img1.width))),
                                            new SmallTextBlock(txtToString(section.getPath() + "wind/small3.txt"),
                                                               marginHorizontal,
                                                               marginVertical+56 + 104 + 2*int(img1.height*(areaWidth*(2.11/3.0)/(float)img1.width)),
                                                               int(areaWidth*(0.99/3.0)), int(img1.height*(areaWidth*(1.99/3.0)/(float)img1.width))) });
  pages.add(p);
  
  /* -------- 個人作品（Tomoka） -------- */
  
  // Tomoka個人表紙
  section = Section.works_tomoka_cover; 
  pages.addAll(generatePersonalCover(section));
  
  section = Section.works_tomoka;
  
  // Pegboard
  
  // Four colors シリーズ
  
  // WAVE
  img = loadImage(section.getPath() + "wave/image.png");
  p = new DescriptionPage(txtToString(section.getPath() + "wave/title.txt"),
                          txtToString(section.getPath() + "wave/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  
  /* -------- 個人作品（Ikanoshiokara） -------- */
  
  // Ikanoshiokara個人表紙
  section = Section.works_ikano_cover; 
  pages.addAll(generatePersonalCover(section));
  
  section = Section.works_ikano;
  
  // LoopLiner & rollingBoll
  
  // circuit & CLIもどきライブラリ
  
  
  /* -------- 個人作品（あきっち） -------- */
  
  // あきっち個人表紙
  section = Section.works_akitch_cover; 
  pages.addAll(generatePersonalCover(section));
  
  section = Section.works_akitch;
  
  // 「200」見開き1ページ（200_all）
  p = new DescriptionPage(txtToString(section.getPath() + "200_all/title.txt"),
                          txtToString(section.getPath() + "200_all/main.txt"),
                          new CodeBlock(txtToString(section.getPath() + "200_all/code.txt"),
                                        marginHorizontal, 262, int(areaWidth*(1.99/3.0)), areaHeight-(262-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "200_all/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 262, int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)));
  pages.add(p);
  p = new LargeImagePage(loadImage(section.getPath() + "200_all/image.png"));
  pages.add(p);
  
  // 200（格子状に4枚）
  img1 = loadImage(section.getPath() + "200/image1.png");
  img2 = loadImage(section.getPath() + "200/image2.png");
  img3 = loadImage(section.getPath() + "200/image3.png");
  img4 = loadImage(section.getPath() + "200/image4.png");
  p = new DescriptionPage(txtToString(section.getPath() + "200/title.txt"),
                          txtToString(section.getPath() + "200/main.txt"),
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.985/2.0)), int(areaWidth*(0.985/2.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.015/2.0)), marginVertical+56,
                                                 int(areaWidth*(0.985/2.0)), int(areaWidth*(0.985/2.0))),
                                       new Image(img3, marginHorizontal, marginVertical+56+int(areaWidth*(1.015/2.0)),
                                                 int(areaWidth*(0.985/2.0)), int(areaWidth*(0.985/2.0))),
                                       new Image(img4, marginHorizontal+int(areaWidth*(1.015/2.0)), marginVertical+56+int(areaWidth*(1.015/2.0)),
                                                 int(areaWidth*(0.985/2.0)), int(areaWidth*(0.985/2.0))) });
  pages.add(p);
  
  // 蕾 (#つぶやきProcessing) / 凝視
  img1 = loadImage(section.getPath() + "tsubomi/image1.png");
  img2 = loadImage(section.getPath() + "tsubomi/image2.png");
  p = new DescriptionPage(txtToString(section.getPath() + "tsubomi/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.01/3.0)), height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))) },
                          new TextBlock[] { new SmallTextBlock(txtToString(section.getPath() + "tsubomi/small1.txt"),
                                                                    width-marginHorizontal-int(areaWidth*(0.99/3.0)), marginVertical+56,
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)),
                                                 new SmallTextBlock(txtToString(section.getPath() + "tsubomi/small2.txt"),
                                                                    marginHorizontal, height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)) });
  pages.add(p);
  
  // 色雫 / 銀菊
  img1 = loadImage(section.getPath() + "iro/image1.png");
  img2 = loadImage(section.getPath() + "iro/image2.png");
  p = new DescriptionPage(txtToString(section.getPath() + "iro/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.01/3.0)), height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))) },
                          new TextBlock[] { new SmallTextBlock(txtToString(section.getPath() + "iro/small1.txt"),
                                                                    width-marginHorizontal-int(areaWidth*(0.99/3.0)), marginVertical+56,
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)),
                                                 new SmallTextBlock(txtToString(section.getPath() + "iro/small2.txt"),
                                                                    marginHorizontal, height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)) });
  pages.add(p);
  
  // 夏色 / 標的 (#つぶやきProcessing)
  img1 = loadImage(section.getPath() + "natsu/image1.png");
  img2 = loadImage(section.getPath() + "natsu/image2.png");
  p = new DescriptionPage(txtToString(section.getPath() + "natsu/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.01/3.0)), height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))) },
                          new TextBlock[] { new SmallTextBlock(txtToString(section.getPath() + "natsu/small1.txt"),
                                                                    width-marginHorizontal-int(areaWidth*(0.99/3.0)), marginVertical+56,
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)),
                                                 new SmallTextBlock(txtToString(section.getPath() + "natsu/small2.txt"),
                                                                    marginHorizontal, height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)) });
  pages.add(p);
  
  // 炎 / 羽
  img1 = loadImage(section.getPath() + "fire/image1.png");
  img2 = loadImage(section.getPath() + "fire/image2.png");
  p = new DescriptionPage(txtToString(section.getPath() + "fire/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.01/3.0)), height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))) },
                          new TextBlock[] { new SmallTextBlock(txtToString(section.getPath() + "fire/small1.txt"),
                                                                    width-marginHorizontal-int(areaWidth*(0.99/3.0)), marginVertical+56,
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)),
                                            new SmallTextBlock(txtToString(section.getPath() + "fire/small2.txt"),
                                                               marginHorizontal, height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                               int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)) });
  pages.add(p);
  
  // 炎
  img1 = loadImage(section.getPath() + "fire12/image1.png");
  img2 = loadImage(section.getPath() + "fire12/image2.png");
  img3 = loadImage(section.getPath() + "fire12/image3.png");
  img4 = loadImage(section.getPath() + "fire12/image4.png");
  img5 = loadImage(section.getPath() + "fire12/image5.png");
  img6 = loadImage(section.getPath() + "fire12/image6.png");
  img7 = loadImage(section.getPath() + "fire12/image7.png");
  img8 = loadImage(section.getPath() + "fire12/image8.png");
  img9 = loadImage(section.getPath() + "fire12/image9.png");
  img10 = loadImage(section.getPath() + "fire12/image10.png");
  img11 = loadImage(section.getPath() + "fire12/image11.png");
  img12 = loadImage(section.getPath() + "fire12/image12.png");
  p = new DescriptionPage(txtToString(section.getPath() + "fire12/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img10, marginHorizontal, marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img11, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img12, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.02/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))) });
  pages.add(p);
  
  // 詰め合わせ
  img1 = loadImage(section.getPath() + "assort/image1.png");
  img2 = loadImage(section.getPath() + "assort/image2.png");
  img3 = loadImage(section.getPath() + "assort/image3.png");
  img4 = loadImage(section.getPath() + "assort/image4.png");
  img5 = loadImage(section.getPath() + "assort/image5.png");
  img6 = loadImage(section.getPath() + "assort/image6.png");
  img7 = loadImage(section.getPath() + "assort/image7.png");
  img8 = loadImage(section.getPath() + "assort/image8.png");
  img9 = loadImage(section.getPath() + "assort/image9.png");
  p = new DescriptionPage(txtToString(section.getPath() + "assort/title.txt"),
                          "", // 本文なし
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+56+int(areaWidth*(1.42/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.42/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.42/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+56+int(areaWidth*(2.82/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.82/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.82/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))) },
                          new TextBlock[] { new CaptionTextBlock(txtToString(section.getPath() + "assort/small1.txt"),
                                                                 marginHorizontal, marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small2.txt"),
                                                                 marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small3.txt"),
                                                                 marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(1.02/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small4.txt"),
                                                                 marginHorizontal, marginVertical+56+int(areaWidth*(2.42/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small5.txt"),
                                                                 marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(2.42/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small6.txt"),
                                                                 marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(2.42/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small7.txt"),
                                                                 marginHorizontal, marginVertical+56+int(areaWidth*(3.82/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small8.txt"),
                                                                 marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+56+int(areaWidth*(3.82/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small9.txt"),
                                                                 marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+56+int(areaWidth*(3.82/3.0)),
                                                                 int(areaWidth*(0.99/3.0)), 36) });
  pages.add(p);
  
  // 猫と雨
  img = loadImage(section.getPath() + "cat/image.png");
  p = new DescriptionPage(txtToString(section.getPath() + "cat/title.txt"),
                          txtToString(section.getPath() + "cat/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  /* -------- 個人作品（eboshidori） -------- */
  
  // eboshidori個人表紙
  section = Section.works_eboshi_cover; 
  pages.addAll(generatePersonalCover(section));
  
  section = Section.works_eboshi;
  
  // 作品名不明
  
  // Rose
  
  // Movie
  
  
  /* -------- 活動アーカイブ（ロゴ）-------- */
  
  section = Section.artis_logo;
  
  img = loadImage(section.getPath() + "image.png");
  p = new DescriptionPage(txtToString(section.getPath() + "title.txt"),
                          txtToString(section.getPath() + "main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  
  /* -------- 活動アーカイブ（サイト）-------- */
  
  section = Section.artis_website;
  
  p = new DescriptionPage(txtToString(section.getPath() + "title.txt"),
                          txtToString(section.getPath() + "main.txt"));
  pages.add(p);
  p = new LargeImagePage(loadImage(section.getPath() + "image.png"));
  pages.add(p);
  
  
  /* -------- 活動アーカイブ（作品展）-------- */
  
  section = Section.artis_exhibition;
  
  // Unity
  img = loadImage(section.getPath() + "unity/image.png");
  p = new DescriptionPage(txtToString(section.getPath() + "unity/title.txt"),
                          txtToString(section.getPath() + "unity/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  // STYLY
  img = loadImage(section.getPath() + "styly/image1.png");
  p = new DescriptionPage(txtToString(section.getPath() + "styly/title.txt"),
                          txtToString(section.getPath() + "styly/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  // Mozilla Hubs
  img = loadImage(section.getPath() + "mozilla/image.png");
  p = new DescriptionPage(txtToString(section.getPath() + "mozilla/title.txt"),
                          txtToString(section.getPath() + "mozilla/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  
  /* -------- あとがき -------- */
  
  
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
