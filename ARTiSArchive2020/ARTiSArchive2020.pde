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
  
  // ohayota個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_ohayota_cover.getPath() + "left.png"));
  pages.add(pL);
  // ohayota個人表紙右
  path = Section.works_ohayota_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.ohayota, loadImage(Section.works_ohayota_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  // ジェネラティブトランプ見開き1ページ
  p = new DescriptionPage(txtToString(Section.works_ohayota.getPath() + "generative/title.txt"),
                          txtToString(Section.works_ohayota.getPath() + "generative/main.txt"),
                          new CodeBlock(txtToString(Section.works_ohayota.getPath() + "generative/code.txt"),
                                        marginHorizontal, 262, int(areaWidth*(1.99/3.0)), areaHeight-(262-marginVertical)),
                          new SmallTextBlock(txtToString(Section.works_ohayota.getPath() + "generative/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 262, int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)));
  pages.add(p);
  p = new LargeImagePage(loadImage(Section.works_ohayota.getPath() + "generative/image.png"));
  pages.add(p);
  
  // Glass Planet
  img1 = loadImage(Section.works_ohayota.getPath() + "glass/image1.png");
  img2 = loadImage(Section.works_ohayota.getPath() + "glass/image2.png");
  p = new DescriptionPage(txtToString(Section.works_ohayota.getPath() + "glass/title.txt"),
                          txtToString(Section.works_ohayota.getPath() + "glass/main.txt"),
                          marginVertical+56 + int(img1.height*(areaWidth/(float)img1.width)) + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56, areaWidth, int(img1.height*(areaWidth/(float)img1.width))),
                                       new Image(img2, marginHorizontal, height-marginVertical-int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width)),
                                                 int(areaWidth*(1.99/3.0)), int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width))) },
                          new SmallTextBlock(txtToString(Section.works_ohayota.getPath() + "glass/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), height-marginVertical-int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width)),
                                             int(areaWidth*(0.99/3.0)), int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width))));
  pages.add(p);
  
  // Silk
  
  // Clear Triangle & Cyan and Magenta
  
  // Flag
  
  // Prism Scope
  
  // Prism Scope (Overwrite)
  
  // 遠ざかる
  
  // リアルタイム
  
  // 破裂
  
  // 虹吹雪
  
  // DIFFERENCE
  
  // 今日と過去の風
  
  
  /* -------- 個人作品（Tomoka） -------- */
  
  // Tomoka個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_tomoka_cover.getPath() + "left.png"));
  pages.add(pL);
  // Tomoka個人表紙右
  path = Section.works_tomoka_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.tomoka, loadImage(Section.works_tomoka_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  // Pegboard
  
  // Four colors シリーズ
  
  // WAVE
  img = loadImage(Section.works_tomoka.getPath() + "wave/image.png");
  p = new DescriptionPage(txtToString(Section.works_tomoka.getPath() + "wave/title.txt"),
                          txtToString(Section.works_tomoka.getPath() + "wave/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  
  /* -------- 個人作品（Ikanoshiokara） -------- */
  
  // Ikanoshiokara個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_ikano_cover.getPath() + "left.png"));
  pages.add(pL);
  // Ikanoshiokara個人表紙右
  path = Section.works_ikano_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.ikano, loadImage(Section.works_ikano_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  // LoopLiner & rollingBoll
  
  // circuit & CLIもどきライブラリ
  
  
  /* -------- 個人作品（あきっち） -------- */
  
  // あきっち個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_akitch_cover.getPath() + "left.png"));
  pages.add(pL);
  // あきっち個人表紙右
  path = Section.works_akitch_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.akitch, loadImage(Section.works_akitch_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  // 「200」見開き1ページ（200_all）
  p = new DescriptionPage(txtToString(Section.works_akitch.getPath() + "200_all/title.txt"),
                          txtToString(Section.works_akitch.getPath() + "200_all/main.txt"),
                          new CodeBlock(txtToString(Section.works_akitch.getPath() + "200_all/code.txt"),
                                        marginHorizontal, 262, int(areaWidth*(1.99/3.0)), areaHeight-(262-marginVertical)),
                          new SmallTextBlock(txtToString(Section.works_akitch.getPath() + "200_all/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 262, int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)));
  pages.add(p);
  p = new LargeImagePage(loadImage(Section.works_akitch.getPath() + "200_all/image.png"));
  pages.add(p);
  
  // 200（格子状に4枚）
  img1 = loadImage(Section.works_akitch.getPath() + "200/image1.png");
  img2 = loadImage(Section.works_akitch.getPath() + "200/image2.png");
  img3 = loadImage(Section.works_akitch.getPath() + "200/image3.png");
  img4 = loadImage(Section.works_akitch.getPath() + "200/image4.png");
  p = new DescriptionPage(txtToString(Section.works_akitch.getPath() + "200/title.txt"),
                          txtToString(Section.works_akitch.getPath() + "200/main.txt"),
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
  img1 = loadImage(Section.works_akitch.getPath() + "tsubomi/image1.png");
  img2 = loadImage(Section.works_akitch.getPath() + "tsubomi/image2.png");
  p = new DescriptionPage(txtToString(Section.works_akitch.getPath() + "tsubomi/title.txt"),
                          "",
                          marginVertical+56 + areaWidth + 24,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+56,
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.01/3.0)), height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                 int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))) },
                          new SmallTextBlock[] { new SmallTextBlock(txtToString(Section.works_akitch.getPath() + "tsubomi/small1.txt"),
                                                                    width-marginHorizontal-int(areaWidth*(0.99/3.0)), marginVertical+56,
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)),
                                                 new SmallTextBlock(txtToString(Section.works_akitch.getPath() + "tsubomi/small2.txt"),
                                                                    marginHorizontal, height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                                    int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)) });
  pages.add(p);
  
  // 銀菊 / 夏色
  
  // 色雫 / 標的 (#つぶやきProcessing)
  
  // 炎 / 羽
  
  // 詰め合わせ
  
  // 猫と雨
  img = loadImage(Section.works_akitch.getPath() + "cat/image.png");
  p = new DescriptionPage(txtToString(Section.works_akitch.getPath() + "cat/title.txt"),
                          txtToString(Section.works_akitch.getPath() + "cat/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  // 炎
  
  
  /* -------- 個人作品（eboshidori） -------- */
  
  // eboshidori個人表紙左
  pL = new PersonalCoverLeft(loadImage(Section.works_eboshi_cover.getPath() + "left.png"));
  pages.add(pL);
  // eboshidori個人表紙右
  path = Section.works_eboshi_cover.getPath() + "selfintro.txt";
  pR = new PersonalCoverRight(Author.eboshi, loadImage(Section.works_eboshi_cover.getPath() + "right.png"), txtToString(path));
  pages.add(pR);
  
  // 作品名不明
  
  // Rose
  
  // Movie
  
  
  /* -------- 活動アーカイブ（ロゴ）-------- */
  
  img = loadImage(Section.artis_logo.getPath() + "image.png");
  p = new DescriptionPage(txtToString(Section.artis_logo.getPath() + "title.txt"),
                          txtToString(Section.artis_logo.getPath() + "main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  
  /* -------- 活動アーカイブ（サイト）-------- */
  
  p = new DescriptionPage(txtToString(Section.artis_website.getPath() + "title.txt"),
                          txtToString(Section.artis_website.getPath() + "main.txt"));
  pages.add(p);
  p = new LargeImagePage(loadImage(Section.artis_website.getPath() + "image.png"));
  pages.add(p);
  
  
  /* -------- 活動アーカイブ（作品展）-------- */
  
  // Unity
  img = loadImage(Section.artis_exhibition.getPath() + "unity/image.png");
  p = new DescriptionPage(txtToString(Section.artis_exhibition.getPath() + "unity/title.txt"),
                          txtToString(Section.artis_exhibition.getPath() + "unity/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  // STYLY
  img = loadImage(Section.artis_exhibition.getPath() + "styly/image1.png");
  p = new DescriptionPage(txtToString(Section.artis_exhibition.getPath() + "styly/title.txt"),
                          txtToString(Section.artis_exhibition.getPath() + "styly/main.txt"),
                          marginVertical+56 + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+56, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  // Mozilla Hubs
  img = loadImage(Section.artis_exhibition.getPath() + "mozilla/image.png");
  p = new DescriptionPage(txtToString(Section.artis_exhibition.getPath() + "mozilla/title.txt"),
                          txtToString(Section.artis_exhibition.getPath() + "mozilla/main.txt"),
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
