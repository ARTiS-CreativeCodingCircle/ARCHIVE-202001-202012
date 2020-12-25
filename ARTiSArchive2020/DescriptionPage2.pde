public class DescriptionPage2 extends Page {
  
  private TextType textType;
  private String title;
  
  private Image[] images;
  
  private SmallTextBlock[] smallTextBlocks;
  
  public DescriptionPage2(Section section, String title, PImage[] pimages, String[] paths) {
    super(section);
    this.title = title;
    this.images = new Image[]{ new Image(pimages[0], marginHorizontal, marginVertical+titleBottomPadding,
                                         int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))),
                               new Image(pimages[1], marginHorizontal+int(areaWidth*(1.01/3.0)), height-marginVertical-int(areaWidth*(1.99/3.0)),
                                         int(areaWidth*(1.99/3.0)), int(areaWidth*(1.99/3.0))) };
    this.smallTextBlocks = new SmallTextBlock[] { new SmallTextBlock(paths[0],
                                                                     width-marginHorizontal-int(areaWidth*(0.99/3.0)), marginVertical+titleBottomPadding,
                                                                     int(areaWidth*(0.99/3.0)), int(areaWidth*(1.99/3.0))),
                                                  new SmallTextBlock(paths[1],
                                                                     marginHorizontal, height-marginVertical-int(areaWidth*(1.99/3.0)),
                                                                     int(areaWidth*(0.99/3.0)), int(areaWidth*(1.99/3.0))) };
  }
  
  public void draw() {
    super.draw();
    
    // タイトル部分の表示
    textType = TextType.title;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    text(title, marginHorizontal, marginVertical);
    
    for (Image image: images) {
      image.draw();
    }
    
    // 作品説明文
    if (smallTextBlocks != null) {
      for (SmallTextBlock stb: smallTextBlocks)
        stb.draw();
    }
  }
  
}
