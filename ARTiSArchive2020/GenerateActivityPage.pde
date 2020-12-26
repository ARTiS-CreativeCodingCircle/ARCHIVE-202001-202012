// サークル活動アーカイブページ生成
ArrayList<Page> generateActivityPages(Section section) {
  
  switch (section) {
    case artis_logo:
      return generateActivityLogoPages(section);
    case artis_website:
      return generateActivityWebsitePages(section);
    case artis_exhibition:
      return generateActivityExhibitionPages(section);
    case artis_workshop:
      return generateActivityWorkshopPages(section);
    default:
      return null;
  }
}



// Logoページ
ArrayList<Page> generateActivityLogoPages(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  PImage img = loadImage(section.getPath() + "image.png");
  
  Page p = new DescriptionPage(section,
                               txtToString(section.getPath() + "title.txt"),
                               txtToString(section.getPath() + "main.txt"),
                               marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                               new Image(img, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, convertImageHeight(img, areaWidth) ));
  pages.add(p);
  
  return pages;
}

// Websiteページ
ArrayList<Page> generateActivityWebsitePages(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  Page p;
  
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "title.txt"),
                          txtToString(section.getPath() + "main.txt"));
  pages.add(p);
  p = new LargeImagePage(section, loadImage(section.getPath() + "image.png"));
  pages.add(p);
  
  return pages;
}

// 作品展ページ
ArrayList<Page> generateActivityExhibitionPages(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  Page p;
  PImage img, img1, img2;
  
  // Unity
  img = loadImage(section.getPath() + "unity/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "unity/title.txt"),
                          txtToString(section.getPath() + "unity/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, convertImageHeight(img, areaWidth)));
  pages.add(p);
  
  // STYLY
  img1 = loadImage(section.getPath() + "styly/image1.png");
  //img2 = loadImage(section.getPath() + "styly/image2.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "styly/title.txt"),
                          txtToString(section.getPath() + "styly/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img1, areaWidth) + 24,
                          new Image(img1, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, convertImageHeight(img1, areaWidth)));
  pages.add(p);
  
  // Mozilla Hubs
  img = loadImage(section.getPath() + "mozilla/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "mozilla/title.txt"),
                          txtToString(section.getPath() + "mozilla/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, convertImageHeight(img, areaWidth) ));
  pages.add(p);
  
  return pages;
}

// Workshopページ
ArrayList<Page> generateActivityWorkshopPages(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  PImage img;
  Page p;
  
  // Workshop#1 "Random"
  img = loadImage(section.getPath() + "workshop1/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "workshop1/title.txt"),
                          txtToString(section.getPath() + "workshop1/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding,
                                    areaWidth, convertImageHeight(img, areaWidth) ),
                          new CodeBlock(txtToString(section.getPath() + "workshop1/code.txt"),
                                        marginHorizontal, 538, int(areaWidth*(1.99/3.0)), areaHeight-(538-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "workshop1/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 538,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(538-marginVertical)));
  pages.add(p);
  
  // Workshop#2 "Noise"
  img = loadImage(section.getPath() + "workshop2/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "workshop2/title.txt"),
                          txtToString(section.getPath() + "workshop2/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding,
                                    areaWidth, convertImageHeight(img, areaWidth) ),
                          new CodeBlock(txtToString(section.getPath() + "workshop2/code.txt"),
                                        marginHorizontal, 500, int(areaWidth*(1.99/3.0)), areaHeight-(500-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "workshop2/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 500,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(500-marginVertical)));
  pages.add(p);
  
  // Workshop#3 "Noise"
  img = loadImage(section.getPath() + "workshop3/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "workshop3/title.txt"),
                          txtToString(section.getPath() + "workshop3/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding,
                                    areaWidth, convertImageHeight(img, areaWidth) ),
                          new CodeBlock(txtToString(section.getPath() + "workshop3/code.txt"),
                                        marginHorizontal, 476, int(areaWidth*(1.99/3.0)), areaHeight-(476-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "workshop3/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 476,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(476-marginVertical)));
  pages.add(p);
  
  // Workshop#4 "Image"
  img = loadImage(section.getPath() + "workshop4/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "workshop4/title.txt"),
                          txtToString(section.getPath() + "workshop4/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding,
                                    areaWidth, convertImageHeight(img, areaWidth) ),
                          new CodeBlock(txtToString(section.getPath() + "workshop4/code.txt"),
                                        marginHorizontal, 500, int(areaWidth*(1.99/3.0)), areaHeight-(500-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "workshop4/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 500,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(500-marginVertical)));
  pages.add(p);
  
  // Workshop#5 "Renderer"
  img = loadImage(section.getPath() + "workshop5/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "workshop5/title.txt"),
                          txtToString(section.getPath() + "workshop5/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding,
                                    areaWidth, convertImageHeight(img, areaWidth) ),
                          new CodeBlock(txtToString(section.getPath() + "workshop5/code.txt"),
                                        marginHorizontal, 500, int(areaWidth*(1.99/3.0)), areaHeight-(500-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "workshop5/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 500,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(500-marginVertical)));
  pages.add(p);
  
  // Workshop#6 "Color"
  img = loadImage(section.getPath() + "workshop6/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "workshop6/title.txt"),
                          txtToString(section.getPath() + "workshop6/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding,
                                    areaWidth, convertImageHeight(img, areaWidth) ),
                          new CodeBlock(txtToString(section.getPath() + "workshop6/code.txt"),
                                        marginHorizontal, 514, int(areaWidth*(1.99/3.0)), areaHeight-(514-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "workshop6/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 514,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(514-marginVertical)));
  pages.add(p);
  
  // Workshop#7 "Recursive"
  img = loadImage(section.getPath() + "workshop7/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "workshop7/title.txt"),
                          txtToString(section.getPath() + "workshop7/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding,
                                    areaWidth, convertImageHeight(img, areaWidth) ),
                          new CodeBlock(txtToString(section.getPath() + "workshop7/code.txt"),
                                        marginHorizontal, 514, int(areaWidth*(1.99/3.0)), areaHeight-(514-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "workshop7/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 514,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(514-marginVertical)));
  pages.add(p);
  
  // Workshop#8 "Attractor"
  img = loadImage(section.getPath() + "workshop8/image.png");
  p = new DescriptionPage(section,
                          txtToString(section.getPath() + "workshop8/title.txt"),
                          txtToString(section.getPath() + "workshop8/main.txt"),
                          marginVertical+titleBottomPadding + convertImageHeight(img, areaWidth) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding,
                                    areaWidth, convertImageHeight(img, areaWidth) ),
                          new CodeBlock(txtToString(section.getPath() + "workshop8/code.txt"),
                                        marginHorizontal, 488, int(areaWidth*(1.99/3.0)), areaHeight-(488-marginVertical)),
                          new SmallTextBlock(txtToString(section.getPath() + "workshop8/small.txt"),
                                             width-marginHorizontal-int(areaWidth*(0.99/3.0)), 488,
                                             int(areaWidth*(0.99/3.0)), areaHeight-(488-marginVertical)));
  pages.add(p);
  
  return pages;
}
