public class Page {
  
  private TextType textType;
  protected String title;
  
  protected Image[] images;
  
  public Page(Image image) {
    title = "";
    this.images = new Image[]{ image };
  }
  
  public Page(Image[] images) {
    title = "Title";
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
