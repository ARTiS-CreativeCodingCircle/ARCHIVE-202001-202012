// 個人ページ生成
ArrayList<Page> generatePersonalWorks(Section section) {
  switch (section) {
    case works_ohayota:
      return generateOhayotaWorks(section);
    case works_tomoka:
      return generateTomokaWorks(section);
    case works_ikano:
      return generateIkanoWorks(section);
    case works_akitch:
      return generateAkitchWorks(section);
    case works_eboshi:
      return generateEboshiWorks(section);
    default:
      return null;
  }
}



// 個人表紙生成
ArrayList<Page> generatePersonalCover(Section section, color textColor, ClearRect[] clearRects) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  // 個人表紙左
  Page pL = new PersonalCoverLeft(section, loadImage(section.getPath() + "left.png"), textColor);
  pages.add(pL);
  // 個人表紙右
  String path = section.getPath() + "selfintro.txt";
  Page pR = new PersonalCoverRight(section, loadImage(section.getPath() + "right.png"), txtToString(path), textColor, clearRects);
  pages.add(pR);
  
  return pages;
}

// ohayota個人作品ページ生成
ArrayList<Page> generateOhayotaWorks(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  Page p;
  PImage img1, img2, img3, img4, img5, img6, img7, img8;
  
  // ジェネラティブトランプ見開き1ページ
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "generative/title.txt"),
                          txtToString(section.getPath() + "generative/main.txt"),
                          new CodeBlock(txtToString(section.getPath() + "generative/code.txt"),
                                        marginHorizontal, 262, int(areaWidth*(1.99/3.0)), areaHeight-(262-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "generative/small.txt"),
                                             int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0))), 262, int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)));
  pages.add(p);
  p = new LargeImagePage(section, loadImage(section.getPath() + "generative/image.png"));
  pages.add(p);
  
  // Glass Planet
  img1 = loadImage(section.getPath() + "glass/image1.png");
  img2 = loadImage(section.getPath() + "glass/image2.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "glass/title.txt"),
                          txtToString(section.getPath() + "glass/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img1, areaWidth) + mainTopPadding,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, convertImageHeight(img1, areaWidth) ),
                                       new Image(img2, marginHorizontal, int(HEIGHT-marginVertical-convertImageHeight(img2, areaWidth*(1.99/3.0))),
                                                 int(areaWidth*(1.99/3.0)), convertImageHeight(img2, areaWidth*(1.99/3.0)) ) },
                          new SmallTextBlock(txtToString(Section.works_ohayota.getPath() + "glass/small.txt"),
                                             int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0))),
                                             int(HEIGHT-marginVertical-convertImageHeight(img2, areaWidth*(1.99/3.0))),
                                             int(areaWidth*(0.99/3.0)), convertImageHeight(img2, areaWidth*(1.99/3.0))));
  pages.add(p);
  
  // Silk
  img1 = loadImage(section.getPath() + "silk/image1.png");
  img2 = loadImage(section.getPath() + "silk/image2.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "silk/title.txt"),
                          txtToString(section.getPath() + "silk/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img1, areaWidth) + mainTopPadding,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, convertImageHeight(img1, areaWidth) ),
                                       new Image(img2, marginHorizontal, int(HEIGHT-marginVertical-int(img2.height*(areaWidth*(1.99/3.0)/(float)img2.width))),
                                                 int(areaWidth*(1.99/3.0)), convertImageHeight(img2, areaWidth*(1.99/3.0)) ) },
                          new SmallTextBlock(txtToString(Section.works_ohayota.getPath() + "silk/small.txt"),
                                             int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0))),
                                             int(HEIGHT-marginVertical-convertImageHeight(img2, areaWidth*(1.99/3.0))),
                                             int(areaWidth*(0.99/3.0)), convertImageHeight(img2, areaWidth*(1.99/3.0))));
  pages.add(p);
  
  // Clear Triangle & Cyan and Magenta
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "clear/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "clear/image1.png"),
                                         loadImage(section.getPath() + "clear/image2.png") },
                           new String[] { txtToString(section.getPath() + "clear/small1.txt"),
                                          txtToString(section.getPath() + "clear/small2.txt") });
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
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "flag/title.txt"),
                          txtToString(section.getPath() + "flag/main.txt"),
                          new Image[]{ new Image(img1, marginHorizontal,
                                                 marginVertical+titleBottomPadding+136,
                                                 int(areaWidth*(0.985/2.0)), convertImageHeight(img1, areaWidth*(0.985/2.0)) ),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.015/2.0)),
                                                 marginVertical+titleBottomPadding+136,
                                                 int(areaWidth*(0.985/2.0)), convertImageHeight(img1, areaWidth*(0.985/2.0)) ),
                                       new Image(img3, marginHorizontal,
                                                 marginVertical+titleBottomPadding+136 + 4+convertImageHeight(img1, areaWidth*(1.015/2.0)),
                                                 int(areaWidth*(0.985/2.0)), convertImageHeight(img1, areaWidth*(0.985/2.0)) ),
                                       new Image(img4, marginHorizontal+int(areaWidth*(1.015/2.0)),
                                                 marginVertical+titleBottomPadding+136 + 4+convertImageHeight(img1, areaWidth*(1.015/2.0)),
                                                 int(areaWidth*(0.985/2.0)), convertImageHeight(img1, areaWidth*(0.985/2.0)) ),
                                       new Image(img5, marginHorizontal,
                                                 marginVertical+titleBottomPadding+136 + 2*(4+convertImageHeight(img1, areaWidth*(1.015/2.0))),
                                                 int(areaWidth*(0.985/2.0)), convertImageHeight(img1, areaWidth*(0.985/2.0)) ),
                                       new Image(img6, marginHorizontal+int(areaWidth*(1.015/2.0)),
                                                 marginVertical+titleBottomPadding+136 + 2*(4+convertImageHeight(img1, areaWidth*(1.015/2.0))),
                                                 int(areaWidth*(0.985/2.0)), convertImageHeight(img1, areaWidth*(0.985/2.0)) ),
                                       new Image(img7, marginHorizontal,
                                                 marginVertical+titleBottomPadding+136 + 3*(4+convertImageHeight(img1, areaWidth*(1.015/2.0))),
                                                 int(areaWidth*(0.985/2.0)), convertImageHeight(img1, areaWidth*(0.985/2.0)) ),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.015/2.0)),
                                                 marginVertical+titleBottomPadding+136 + 3*(4+convertImageHeight(img1, areaWidth*(1.015/2.0))),
                                                 int(areaWidth*(0.985/2.0)), convertImageHeight(img1, areaWidth*(0.985/2.0)) ) },
                          new SmallTextBlock(txtToString(section.getPath() + "flag/small.txt"),
                                             marginHorizontal, int(HEIGHT-marginVertical-24),
                                             areaWidth, 32));
  pages.add(p);
  
  // Prism Scope
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "prism/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "prism/image1.png"),
                                          loadImage(section.getPath() + "prism/image2.png"),
                                          loadImage(section.getPath() + "prism/image3.png"),
                                          loadImage(section.getPath() + "prism/image4.png"),
                                          loadImage(section.getPath() + "prism/image5.png"),
                                          loadImage(section.getPath() + "prism/image6.png"),
                                          loadImage(section.getPath() + "prism/image7.png"),
                                          loadImage(section.getPath() + "prism/image8.png"),
                                          loadImage(section.getPath() + "prism/image9.png"),
                                          loadImage(section.getPath() + "prism/image10.png"),
                                          loadImage(section.getPath() + "prism/image11.png"),
                                          loadImage(section.getPath() + "prism/image12.png") },
                            txtToString(section.getPath() + "prism/small.txt"));
  pages.add(p);
  
  // Prism Scope (Overwrite)
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "prism_over/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "prism_over/image1.png"),
                                          loadImage(section.getPath() + "prism_over/image2.png"),
                                          loadImage(section.getPath() + "prism_over/image3.png"),
                                          loadImage(section.getPath() + "prism_over/image4.png"),
                                          loadImage(section.getPath() + "prism_over/image5.png"),
                                          loadImage(section.getPath() + "prism_over/image6.png"),
                                          loadImage(section.getPath() + "prism_over/image7.png"),
                                          loadImage(section.getPath() + "prism_over/image8.png"),
                                          loadImage(section.getPath() + "prism_over/image9.png"),
                                          loadImage(section.getPath() + "prism_over/image10.png"),
                                          loadImage(section.getPath() + "prism_over/image11.png"),
                                          loadImage(section.getPath() + "prism_over/image12.png") },
                            txtToString(section.getPath() + "prism_over/small.txt"));
  pages.add(p);
  
  // 遠ざかる
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "goaway/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "goaway/image1.png"),
                                          loadImage(section.getPath() + "goaway/image2.png"),
                                          loadImage(section.getPath() + "goaway/image3.png"),
                                          loadImage(section.getPath() + "goaway/image4.png"),
                                          loadImage(section.getPath() + "goaway/image5.png"),
                                          loadImage(section.getPath() + "goaway/image6.png"),
                                          loadImage(section.getPath() + "goaway/image7.png"),
                                          loadImage(section.getPath() + "goaway/image8.png"),
                                          loadImage(section.getPath() + "goaway/image9.png"),
                                          loadImage(section.getPath() + "goaway/image10.png"),
                                          loadImage(section.getPath() + "goaway/image11.png"),
                                          loadImage(section.getPath() + "goaway/image12.png") },
                            txtToString(section.getPath() + "goaway/small.txt"));
  pages.add(p);
  
  // リアルタイム
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "real/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "real/image1.png"),
                                          loadImage(section.getPath() + "real/image2.png"),
                                          loadImage(section.getPath() + "real/image3.png"),
                                          loadImage(section.getPath() + "real/image4.png"),
                                          loadImage(section.getPath() + "real/image5.png"),
                                          loadImage(section.getPath() + "real/image6.png"),
                                          loadImage(section.getPath() + "real/image7.png"),
                                          loadImage(section.getPath() + "real/image8.png"),
                                          loadImage(section.getPath() + "real/image9.png"),
                                          loadImage(section.getPath() + "real/image10.png"),
                                          loadImage(section.getPath() + "real/image11.png"),
                                          loadImage(section.getPath() + "real/image12.png") },
                            txtToString(section.getPath() + "real/small.txt"));
  pages.add(p);
  
  // 破裂
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "rupture/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "rupture/image1.png"),
                                          loadImage(section.getPath() + "rupture/image2.png"),
                                          loadImage(section.getPath() + "rupture/image3.png"),
                                          loadImage(section.getPath() + "rupture/image4.png"),
                                          loadImage(section.getPath() + "rupture/image5.png"),
                                          loadImage(section.getPath() + "rupture/image6.png"),
                                          loadImage(section.getPath() + "rupture/image7.png"),
                                          loadImage(section.getPath() + "rupture/image8.png"),
                                          loadImage(section.getPath() + "rupture/image9.png"),
                                          loadImage(section.getPath() + "rupture/image10.png"),
                                          loadImage(section.getPath() + "rupture/image11.png"),
                                          loadImage(section.getPath() + "rupture/image12.png") },
                            txtToString(section.getPath() + "rupture/small.txt"));
  pages.add(p);
  
  // 虹吹雪
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "rainbow/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "rainbow/image1.png"),
                                          loadImage(section.getPath() + "rainbow/image2.png"),
                                          loadImage(section.getPath() + "rainbow/image3.png"),
                                          loadImage(section.getPath() + "rainbow/image4.png"),
                                          loadImage(section.getPath() + "rainbow/image5.png"),
                                          loadImage(section.getPath() + "rainbow/image6.png"),
                                          loadImage(section.getPath() + "rainbow/image7.png"),
                                          loadImage(section.getPath() + "rainbow/image8.png"),
                                          loadImage(section.getPath() + "rainbow/image9.png"),
                                          loadImage(section.getPath() + "rainbow/image10.png"),
                                          loadImage(section.getPath() + "rainbow/image11.png"),
                                          loadImage(section.getPath() + "rainbow/image12.png") },
                            txtToString(section.getPath() + "rainbow/small.txt"));
  pages.add(p);
  
  // DIFFERENCE
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "diff/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "diff/image1.png"),
                                          loadImage(section.getPath() + "diff/image2.png"),
                                          loadImage(section.getPath() + "diff/image3.png"),
                                          loadImage(section.getPath() + "diff/image4.png"),
                                          loadImage(section.getPath() + "diff/image5.png"),
                                          loadImage(section.getPath() + "diff/image6.png"),
                                          loadImage(section.getPath() + "diff/image7.png"),
                                          loadImage(section.getPath() + "diff/image8.png"),
                                          loadImage(section.getPath() + "diff/image9.png"),
                                          loadImage(section.getPath() + "diff/image10.png"),
                                          loadImage(section.getPath() + "diff/image11.png"),
                                          loadImage(section.getPath() + "diff/image12.png") },
                            txtToString(section.getPath() + "diff/small.txt"));
  pages.add(p);
  
  // 今日と過去の風
  img1 = loadImage(section.getPath() + "wind/image1.png");
  img2 = loadImage(section.getPath() + "wind/image2.png");
  img3 = loadImage(section.getPath() + "wind/image3.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "wind/title.txt"),
                          txtToString(section.getPath() + "wind/main.txt"),
                          new Image[]{ new Image(img1, marginHorizontal+int(areaWidth*(1.01/3.0)),
                                                 marginVertical+titleBottomPadding + 104,
                                                 int(areaWidth*(1.99/3.0)), convertImageHeight(img1, areaWidth*(1.99/3.0)) ),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.01/3.0)),
                                                 marginVertical+titleBottomPadding + 104 + convertImageHeight(img1, areaWidth*(2.11/3.0)),
                                                 int(areaWidth*(1.99/3.0)), convertImageHeight(img1, areaWidth*(1.99/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(1.01/3.0)),
                                                 marginVertical+titleBottomPadding + 104 + 2*convertImageHeight(img1, areaWidth*(2.11/3.0)),
                                                 int(areaWidth*(1.99/3.0)), convertImageHeight(img1, areaWidth*(1.99/3.0))) },
                          new TextBlock[] { new SmallTextBlock(txtToString(section.getPath() + "wind/small1.txt"),
                                                               marginHorizontal,
                                                               marginVertical+titleBottomPadding + 104,
                                                               int(areaWidth*(0.99/3.0)), convertImageHeight(img1, areaWidth*(1.99/3.0))),
                                            new SmallTextBlock(txtToString(section.getPath() + "wind/small2.txt"),
                                                               marginHorizontal,
                                                               marginVertical+titleBottomPadding + 104 + convertImageHeight(img1, areaWidth*(2.11/3.0)),
                                                               int(areaWidth*(0.99/3.0)), convertImageHeight(img1, areaWidth*(1.99/3.0)) ),
                                            new SmallTextBlock(txtToString(section.getPath() + "wind/small3.txt"),
                                                               marginHorizontal,
                                                               marginVertical+titleBottomPadding + 104 + 2*convertImageHeight(img1, areaWidth*(2.11/3.0)),
                                                               int(areaWidth*(0.99/3.0)), convertImageHeight(img1, areaWidth*(1.99/3.0)) ) });
  pages.add(p);
  
  return pages;
}

// Tomoka個人作品ページ生成
ArrayList<Page> generateTomokaWorks(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  Page p;
  PImage img;
  
  // Lines
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "lines/title.txt"),
                          txtToString(section.getPath() + "lines/main.txt"),
                          new CodeBlock(txtToString(section.getPath() + "lines/code.txt"),
                                        marginHorizontal, 424, int(areaWidth*(1.99/3.0)), areaHeight-(424-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "lines/small.txt"),
                                             int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0))), 424,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(424-marginVertical)));
  pages.add(p);
  p = new LargeImagePage2(section,
                          new PImage[]{ loadImage(section.getPath() + "lines/image1.png"),
                                        loadImage(section.getPath() + "lines/image2.png") });
  pages.add(p);
  
  // Four colors シリーズ
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "four/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "four/image1.png"),
                                         loadImage(section.getPath() + "four/image2.png") },
                           new String[] { txtToString(section.getPath() + "four/small1.txt"),
                                          txtToString(section.getPath() + "four/small2.txt") });
  pages.add(p);
  
  // WAVE
  img = loadImage(section.getPath() + "wave/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "wave/title.txt"),
                          txtToString(section.getPath() + "wave/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + mainTopPadding,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, convertImageHeight(img, areaWidth) ));
  pages.add(p);
  
  return pages;
}

// Ikanoshiokara個人作品ページ生成
ArrayList<Page> generateIkanoWorks(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  Page p;
  
  // LoopLiner & rollingBoll
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "loop/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "loop/image1.png"),
                                         loadImage(section.getPath() + "loop/image2.png") },
                           new String[] { txtToString(section.getPath() + "loop/small1.txt"),
                                          txtToString(section.getPath() + "loop/small2.txt") });
  pages.add(p);
  
  // circuit & CLIもどきライブラリ
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "circuit/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "circuit/image1.png"),
                                         loadImage(section.getPath() + "circuit/image2.png") },
                           new String[] { txtToString(section.getPath() + "circuit/small1.txt"),
                                          txtToString(section.getPath() + "circuit/small2.txt") });
  pages.add(p);
  
  return pages;
}

// あきっち個人作品ページ生成
ArrayList<Page> generateAkitchWorks(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  Page p;
  PImage img, img1, img2, img3, img4, img5, img6, img7, img8, img9;
  
  // 「200」見開き1ページ（200_all）
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "200_all/title.txt"),
                          txtToString(section.getPath() + "200_all/main.txt"),
                          new CodeBlock(txtToString(section.getPath() + "200_all/code.txt"),
                                        marginHorizontal, 262, int(areaWidth*(1.99/3.0)), areaHeight-(262-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "200_all/small.txt"),
                                             int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0))), 262,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(262-marginVertical)));
  pages.add(p);
  p = new LargeImagePage(section, loadImage(section.getPath() + "200_all/image.png"));
  pages.add(p);
  
  // 200（格子状に4枚）
  p = new DescriptionPage4(section,
                           txtToString(section.getPath() + "200/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "200/image1.png"),
                                         loadImage(section.getPath() + "200/image2.png"),
                                         loadImage(section.getPath() + "200/image3.png"),
                                         loadImage(section.getPath() + "200/image4.png") },
                           txtToString(section.getPath() + "200/small.txt"));
  pages.add(p);
  
  // 蕾 (#つぶやきProcessing) / 凝視
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "tsubomi/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "tsubomi/image1.png"),
                                         loadImage(section.getPath() + "tsubomi/image2.png") },
                           new String[] { txtToString(section.getPath() + "tsubomi/small1.txt"),
                                          txtToString(section.getPath() + "tsubomi/small2.txt") });
  pages.add(p);
  
  // 色雫 / 銀菊
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "iro/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "iro/image1.png"),
                                         loadImage(section.getPath() + "iro/image2.png") },
                           new String[] { txtToString(section.getPath() + "iro/small1.txt"),
                                          txtToString(section.getPath() + "iro/small2.txt") });
  pages.add(p);
  
  // 夏色 / 標的 (#つぶやきProcessing)
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "natsu/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "natsu/image1.png"),
                                         loadImage(section.getPath() + "natsu/image2.png") },
                           new String[] { txtToString(section.getPath() + "natsu/small1.txt"),
                                          txtToString(section.getPath() + "natsu/small2.txt") });
  pages.add(p);
  
  // 炎 / 羽
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "fire/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "fire/image1.png"),
                                         loadImage(section.getPath() + "fire/image2.png") },
                           new String[] { txtToString(section.getPath() + "fire/small1.txt"),
                                          txtToString(section.getPath() + "fire/small2.txt") });
  pages.add(p);
  
  // 炎
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "fire12/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "fire12/image1.png"),
                                          loadImage(section.getPath() + "fire12/image2.png"),
                                          loadImage(section.getPath() + "fire12/image3.png"),
                                          loadImage(section.getPath() + "fire12/image4.png"),
                                          loadImage(section.getPath() + "fire12/image5.png"),
                                          loadImage(section.getPath() + "fire12/image6.png"),
                                          loadImage(section.getPath() + "fire12/image7.png"),
                                          loadImage(section.getPath() + "fire12/image8.png"),
                                          loadImage(section.getPath() + "fire12/image9.png"),
                                          loadImage(section.getPath() + "fire12/image10.png"),
                                          loadImage(section.getPath() + "fire12/image11.png"),
                                          loadImage(section.getPath() + "fire12/image12.png") },
                            txtToString(section.getPath() + "fire12/small.txt"));
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
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "assort/title.txt"),
                          "", // 本文なし
                          marginVertical+titleBottomPadding + areaWidth + mainTopPadding,
                          new Image[]{ new Image(img1, marginHorizontal, marginVertical+titleBottomPadding,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img2, marginHorizontal+int(areaWidth*(1.015/3.0)), marginVertical+titleBottomPadding,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img3, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding,
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img4, marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(1.42/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img5, marginHorizontal+int(areaWidth*(1.015/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(1.42/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img6, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(1.42/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img7, marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(2.82/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img8, marginHorizontal+int(areaWidth*(1.015/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(2.82/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                                       new Image(img9, marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(2.82/3.0)),
                                                 int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))) },
                          new TextBlock[] { new CaptionTextBlock(txtToString(section.getPath() + "assort/small1.txt"),
                                                                 marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(1.02/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small2.txt"),
                                                                 marginHorizontal+int(areaWidth*(1.01/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(1.02/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small3.txt"),
                                                                 marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(1.02/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small4.txt"),
                                                                 marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(2.42/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small5.txt"),
                                                                 marginHorizontal+int(areaWidth*(1.01/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(2.42/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small6.txt"),
                                                                 marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(2.42/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small7.txt"),
                                                                 marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(3.82/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small8.txt"),
                                                                 marginHorizontal+int(areaWidth*(1.01/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(3.82/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36),
                                            new CaptionTextBlock(txtToString(section.getPath() + "assort/small9.txt"),
                                                                 marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(3.82/3.0)),
                                                                 int(areaWidth*(0.98/3.0)), 36) });
  pages.add(p);
  
  // 猫と雨
  img = loadImage(section.getPath() + "cat/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "cat/title.txt"),
                          txtToString(section.getPath() + "cat/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + mainTopPadding,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, convertImageHeight(img, areaWidth) ));
  pages.add(p);
  
  return pages;
}

// eboshidori個人作品ページ生成
ArrayList<Page> generateEboshiWorks(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  Page p;
  
  // 遠くから眺めた凝縮
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "far/title.txt"),
                          txtToString(section.getPath() + "far/main.txt"),
                          new CodeBlock(txtToString(section.getPath() + "far/code.txt"),
                                        marginHorizontal, 388, int(areaWidth*(1.99/3.0)), areaHeight-(388-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "far/small.txt"),
                                             int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0))), 388,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(388-marginVertical)));
  pages.add(p);
  p = new LargeImagePage2(section,
                          new PImage[]{ loadImage(section.getPath() + "far/image1.png"),
                                        loadImage(section.getPath() + "far/image2.png") });
  pages.add(p);
  
  // Rose
  p = new DescriptionPage2(section,
                           txtToString(section.getPath() + "rose/title.txt"),
                           new PImage[]{ loadImage(section.getPath() + "rose/image1.png"),
                                         loadImage(section.getPath() + "rose/image2.png") },
                           new String[] { txtToString(section.getPath() + "rose/small1.txt"),
                                          txtToString(section.getPath() + "rose/small2.txt") });
  pages.add(p);
  
  // Movie
  p = new DescriptionPage12(section,
                            txtToString(section.getPath() + "movie/title.txt"),
                            new PImage[]{ loadImage(section.getPath() + "movie/image1.png"),
                                          loadImage(section.getPath() + "movie/image2.png"),
                                          loadImage(section.getPath() + "movie/image3.png"),
                                          loadImage(section.getPath() + "movie/image4.png"),
                                          loadImage(section.getPath() + "movie/image5.png"),
                                          loadImage(section.getPath() + "movie/image6.png"),
                                          loadImage(section.getPath() + "movie/image7.png"),
                                          loadImage(section.getPath() + "movie/image8.png"),
                                          loadImage(section.getPath() + "movie/image9.png"),
                                          loadImage(section.getPath() + "movie/image10.png"),
                                          loadImage(section.getPath() + "movie/image11.png"),
                                          loadImage(section.getPath() + "movie/image12.png") },
                            txtToString(section.getPath() + "movie/small.txt"));
  pages.add(p);
  
  return pages;
}
