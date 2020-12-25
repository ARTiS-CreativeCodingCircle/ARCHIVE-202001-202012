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
  
  Page p = new DescriptionPage(txtToString(section.getPath() + "title.txt"),
                          txtToString(section.getPath() + "main.txt"),
                          marginVertical+titleBottomPadding + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  return pages;
}

// Websiteページ
ArrayList<Page> generateActivityWebsitePages(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  Page p;
  
  p = new DescriptionPage(txtToString(section.getPath() + "title.txt"),
                          txtToString(section.getPath() + "main.txt"));
  pages.add(p);
  p = new LargeImagePage(loadImage(section.getPath() + "image.png"));
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
  p = new DescriptionPage(txtToString(section.getPath() + "unity/title.txt"),
                          txtToString(section.getPath() + "unity/main.txt"),
                          marginVertical+titleBottomPadding + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  // STYLY
  img1 = loadImage(section.getPath() + "styly/image1.png");
  //img2 = loadImage(section.getPath() + "styly/image2.png");
  p = new DescriptionPage(txtToString(section.getPath() + "styly/title.txt"),
                          txtToString(section.getPath() + "styly/main.txt"),
                          marginVertical+titleBottomPadding + int(img.height*(areaWidth/(float)img1.width)) + 24,
                          new Image(img1, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, int(img1.height*(areaWidth/(float)img1.width))));
  pages.add(p);
  
  // Mozilla Hubs
  img = loadImage(section.getPath() + "mozilla/image.png");
  p = new DescriptionPage(txtToString(section.getPath() + "mozilla/title.txt"),
                          txtToString(section.getPath() + "mozilla/main.txt"),
                          marginVertical+titleBottomPadding + int(img.height*(areaWidth/(float)img.width)) + 24,
                          new Image(img, marginHorizontal, marginVertical+titleBottomPadding, areaWidth, int(img.height*(areaWidth/(float)img.width))));
  pages.add(p);
  
  return pages;
}

// Workshopページ
ArrayList<Page> generateActivityWorkshopPages(Section section) {
  ArrayList<Page> pages = new ArrayList<Page>();
  
  return pages;
}
