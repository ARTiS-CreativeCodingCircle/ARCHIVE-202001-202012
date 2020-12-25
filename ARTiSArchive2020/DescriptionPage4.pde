public class DescriptionPage4 extends Page {
  
  private TextType textType;
  private String title;
  
  private Image[] images;
  
  private SmallTextBlock smallTextBlock;
  
  public DescriptionPage4(Section section, String title, PImage[] pimages, String path) {
    super(section);
    this.title = title;
    this.images = new Image[]{ new Image(pimages[0], marginHorizontal, marginVertical+titleBottomPadding,
                                         int(areaWidth*(0.985/2.0)), int(areaWidth*(0.985/2.0))),
                               new Image(pimages[1], marginHorizontal+int(areaWidth*(1.015/2.0)), marginVertical+titleBottomPadding,
                                         int(areaWidth*(0.985/2.0)), int(areaWidth*(0.985/2.0))),
                               new Image(pimages[2], marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(1.015/2.0)),
                                         int(areaWidth*(0.985/2.0)), int(areaWidth*(0.985/2.0))),
                               new Image(pimages[3], marginHorizontal+int(areaWidth*(1.015/2.0)), marginVertical+titleBottomPadding+int(areaWidth*(1.015/2.0)),
                                         int(areaWidth*(0.985/2.0)), int(areaWidth*(0.985/2.0))) };
    this.smallTextBlock = new SmallTextBlock(path,
                                             marginHorizontal, marginVertical+titleBottomPadding + areaWidth + 8,
                                             areaWidth, int(areaWidth*(1.99/3.0)));
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
    
    // ページ下部の説明文表示
    if (smallTextBlock != null) {
        smallTextBlock.draw();
    }
  }
  
}
