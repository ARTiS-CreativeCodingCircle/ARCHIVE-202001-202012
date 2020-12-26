public class LargeImagePage extends Page {
  
  private Image largeImage;
  
  public LargeImagePage(Section section, PImage largeImage) {
    super(section);
    float ratio = largeImage.width/(float)largeImage.height;
    this.largeImage = new Image(largeImage, int(WIDTH/2-int(areaHeight*ratio)/2), int(HEIGHT/2-areaHeight/2), int(areaHeight*ratio), areaHeight);
  }
  
  public void draw() {
    super.draw();
    
    largeImage.draw();
  }
  
}
