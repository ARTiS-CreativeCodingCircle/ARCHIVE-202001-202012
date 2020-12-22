public class Page {
  
  TextType textType;
  String title;
  
  Image[] images;
  
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
