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
  PImage img1 = loadImage(Section.works_ohayota.getPath() + "glass/image1.png");
  PImage img2 = loadImage(Section.works_ohayota.getPath() + "glass/image2.png");
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
