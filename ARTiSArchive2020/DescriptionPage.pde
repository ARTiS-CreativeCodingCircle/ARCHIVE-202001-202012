public class DescriptionPage extends Page {
  
  private TextType textType;
  private String title;
  private String mainText;
  
  int mainTextCornerY;
  
  private Image[] images;
  
  private CodeBlock codeBlock;
  private SmallTextBlock smallTextBlock;
  
  public DescriptionPage(String title, String mainText) {
    this.title = title;
    this.mainText = mainText;
    this.mainTextCornerY = marginVertical+56;
    this.images = new Image[]{};
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, CodeBlock codeBlock, SmallTextBlock smallTextBlock) {
    this.title = title;
    this.mainText = mainText;
    this.codeBlock = codeBlock;
    this.smallTextBlock = smallTextBlock;
    this.mainTextCornerY = marginVertical+56;
    this.images = new Image[]{};
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, Image[] images) {
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = marginVertical+56;
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, Image[] images, CodeBlock codeBlock, SmallTextBlock smallTextBlock) {
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.codeBlock = codeBlock;
    this.smallTextBlock = smallTextBlock;
    this.mainTextCornerY = marginVertical+56;
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, Image image) {
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
    this.mainTextCornerY = marginVertical+56;
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, Image image, CodeBlock codeBlock, SmallTextBlock smallTextBlock) {
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
    this.codeBlock = codeBlock;
    this.smallTextBlock = smallTextBlock;
    this.mainTextCornerY = marginVertical+56;
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, int mainTextCornerY, Image image, CodeBlock codeBlock, SmallTextBlock smallTextBlock) {
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
    this.codeBlock = codeBlock;
    this.smallTextBlock = smallTextBlock;
    this.mainTextCornerY = mainTextCornerY;
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, int mainTextCornerY, Image[] images) {
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = mainTextCornerY;
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, int mainTextCornerY, Image[] images, SmallTextBlock smallTextBlock) {
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = mainTextCornerY;
    this.smallTextBlock = smallTextBlock;
  }
  
  // Overload
  public DescriptionPage(String title, String mainText, int mainTextCornerY, Image image) {
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
    this.mainTextCornerY = mainTextCornerY;
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
    
    // 本文の表示
    textType = TextType.main;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    // 自動改行（日本語の場合は改行位置に半角スペースが必要）
    text(mainText, marginHorizontal, mainTextCornerY, areaWidth, areaHeight);
    
    // コードブロックの表示
    if (codeBlock != null) codeBlock.draw();
    // コード説明ブロックの表示
    if (smallTextBlock != null) smallTextBlock.draw();
  }
  
}
