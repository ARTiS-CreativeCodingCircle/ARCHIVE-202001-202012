public class DescriptionPage extends Page {
  
  private TextType textType;
  private String title;
  private String mainText;
  
  private Image[] images;
  
  public DescriptionPage(String title, String mainText) {
    this.title = title;
    this.mainText = mainText;
  }
  
  public DescriptionPage(String title, String mainText, Image[] images) {
    this.title = title;
    this.mainText = mainText;
    this.images = images;
  }
  
  public DescriptionPage(String title, String mainText, Image image) {
    this.title = title;
    this.mainText = mainText;
    this.images = new Image[]{ image };
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
    
    // 本文の表示
    textType = TextType.main;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    // 自動改行（日本語の場合は改行位置に半角スペースが必要）
    text(mainText, marginHorizontal, marginVertical+56, areaWidth, areaHeight);
  }
  
}
