public class Image {
  
  PImage image;
  int imageCornerX;
  int imageCornerY;
  int imageWidth;
  int imageHeight;
  
  public Image(PImage image, int imageCornerX, int imageCornerY, int imageWidth, int imageHeight) {
    this.image = image;
    this.imageCornerX = imageCornerX;
    this.imageCornerY = imageCornerY;
    this.imageWidth = imageWidth;
    this.imageHeight = imageHeight;
  }
  
  public void draw() {
    image(image, imageCornerX, imageCornerY, imageWidth, imageHeight);
  }
  
}
