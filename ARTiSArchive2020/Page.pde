public class Page {
  
  private TextType textType;
  protected String title;
  
  protected Image[] images;
  
  public Page(String title, Image image) {
    this.title = title;
    this.images = new Image[]{ image };
  }
  
  public Page(String title, Image[] images) {
    this.title = title;
    this.images = images;
  }
  
  public void draw() {
    if (isVisibleGrid) {
      imageMode(CENTER);
      image(grid, width/2, height/2, areaWidth, areaHeight);
    }
    
    textType = TextType.title;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    text(title, marginHorizontal, marginVertical);
  }
  
}
