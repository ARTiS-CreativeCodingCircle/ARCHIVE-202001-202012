public class LargeImagePage extends Page {
  
  private Image largeImage;
  
  public LargeImagePage(PImage largeImage) {
    float ratio = largeImage.width/(float)largeImage.height;
    this.largeImage = new Image(largeImage, width/2, height/2, int(areaHeight*ratio), areaHeight);
  }
  
  public void draw() {
    if (isVisibleGrid) {
      imageMode(CENTER);
      image(grid, width/2, height/2, areaWidth, areaHeight);
    }
    
    imageMode(CENTER);
    largeImage.draw();
  }
  
}
