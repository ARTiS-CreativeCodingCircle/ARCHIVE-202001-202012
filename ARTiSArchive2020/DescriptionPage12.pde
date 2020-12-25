public class DescriptionPage12 extends Page {
  
  private TextType textType;
  private String title;
  
  private Image[] images;
  
  private SmallTextBlock smallTextBlock;
  
  public DescriptionPage12(String title, PImage[] pimages, String path) {
    this.title = title;
    this.images = new Image[]{ new Image(pimages[0], marginHorizontal, marginVertical+titleBottomPadding,
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[1], marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+titleBottomPadding,
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[2], marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding,
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[3], marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(1.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[4], marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(1.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[5], marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(1.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[6], marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(2.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[7], marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(2.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[8], marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(2.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[9], marginHorizontal, marginVertical+titleBottomPadding+int(areaWidth*(3.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[10], marginHorizontal+int(areaWidth*(1.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(3.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))),
                               new Image(pimages[11], marginHorizontal+int(areaWidth*(2.02/3.0)), marginVertical+titleBottomPadding+int(areaWidth*(3.02/3.0)),
                                         int(areaWidth*(0.98/3.0)), int(areaWidth*(0.98/3.0))) };
    this.smallTextBlock = new SmallTextBlock(path, marginHorizontal, height-marginVertical-24, areaWidth, 32);
  }
  
  public void draw() {
    if (isVisibleGrid) {
      imageMode(CENTER);
      image(grid, width/2, height/2, areaWidth, areaHeight);
    }
    
    // タイトル部分の表示
    textType = TextType.title;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    text(title, marginHorizontal, marginVertical);
    
    for (Image image: images) {
      image.draw();
    }
    
    // ページ下部の説明文1行表示
    if (smallTextBlock != null) {
        smallTextBlock.draw();
    }
  }
  
}
