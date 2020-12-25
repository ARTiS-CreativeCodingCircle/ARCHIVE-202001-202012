public class DescriptionPage extends Page {
  
  private TextType textType;
  private String title;
  private String mainText;
  
  int mainTextCornerY;
  
  private Image[] images;
  
  private CodeBlock codeBlock;
  private TextBlock[] textBlocks;
  
  public DescriptionPage(Section section, String title, String mainText) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.mainTextCornerY = marginVertical+titleBottomPadding;
    this.images = new Image[]{};
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, CodeBlock codeBlock, TextBlock textBlock) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.codeBlock = codeBlock;
    this.textBlocks = new TextBlock[]{ textBlock };
    this.mainTextCornerY = marginVertical+titleBottomPadding;
    this.images = new Image[]{};
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, Image[] images) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = marginVertical+titleBottomPadding;
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, Image[] images, CodeBlock codeBlock, TextBlock textBlock) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.codeBlock = codeBlock;
    this.textBlocks = new TextBlock[]{ textBlock };
    this.mainTextCornerY = marginVertical+titleBottomPadding;
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, Image image) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
    this.mainTextCornerY = marginVertical+titleBottomPadding;
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, Image image, CodeBlock codeBlock, TextBlock textBlock) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
    this.codeBlock = codeBlock;
    this.textBlocks = new TextBlock[]{ textBlock };
    this.mainTextCornerY = marginVertical+titleBottomPadding;
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, int mainTextCornerY, Image image, CodeBlock codeBlock, TextBlock textBlock) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
    this.codeBlock = codeBlock;
    this.textBlocks = new TextBlock[]{ textBlock };
    this.mainTextCornerY = mainTextCornerY;
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, int mainTextCornerY, Image[] images) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = mainTextCornerY;
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, int mainTextCornerY, Image[] images, TextBlock textBlock) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = mainTextCornerY;
    this.textBlocks = new TextBlock[]{ textBlock };
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, Image[] images, TextBlock textBlock) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = marginVertical+titleBottomPadding;
    this.textBlocks = new TextBlock[]{ textBlock };
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, int mainTextCornerY, Image[] images, TextBlock[] textBlocks) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = mainTextCornerY;
    this.textBlocks = textBlocks;
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, Image[] images, TextBlock[] textBlocks) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = images;
    this.mainTextCornerY = marginVertical+titleBottomPadding;
    this.textBlocks = textBlocks;
  }
  
  // Overload
  public DescriptionPage(Section section, String title, String mainText, int mainTextCornerY, Image image) {
    super(section);
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
    this.mainTextCornerY = mainTextCornerY;
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
    if (textBlocks != null) {
      for (TextBlock textBlock: textBlocks) {
        textBlock.draw();
      }
    }
  }
  
}
