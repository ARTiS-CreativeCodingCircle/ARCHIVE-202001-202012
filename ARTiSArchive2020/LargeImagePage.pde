public class LargeImagePage extends Page {
  
  private Image largeImage;
  
  public LargeImagePage(PImage largeImage) {
    super();
    float ratio = largeImage.width/(float)largeImage.height;
    this.largeImage = new Image(largeImage, width/2-int(areaHeight*ratio)/2, height/2-areaHeight/2, int(areaHeight*ratio), areaHeight);
  }
  
  public void draw() {
    super.draw();
    
    largeImage.draw();
  }
  
}
