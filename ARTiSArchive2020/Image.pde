public class Image {
  
  PImage image;
  int imageCornerX;
  int imageCornerY;
  int imageWidth;
  int imageHeight;
  
  public Image(PImage image) {
    this.image = image;
    this.imageCornerX = 0;
    this.imageCornerY = 0;
    this.imageWidth = int(WIDTH);
    this.imageHeight = int(HEIGHT);
  }
  
  // Overload
  public Image(PImage image, int imageCornerX, int imageCornerY, int imageWidth, int imageHeight) {
    this.image = image;
    this.imageCornerX = imageCornerX;
    this.imageCornerY = imageCornerY;
    this.imageWidth = imageWidth;
    this.imageHeight = imageHeight;
  }
  
  public void draw() {
    imageMode(CORNER);
    image(image, imageCornerX, imageCornerY, imageWidth, imageHeight);
  }
  
}
