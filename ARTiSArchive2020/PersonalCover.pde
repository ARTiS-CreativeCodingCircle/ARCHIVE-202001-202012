public class PersonalCover extends Page {
  
  public PersonalCover(PImage image) {
    super(new Image(image));
  }
  
  public void draw() {
    Image i = images[0];
    image(i.image, i.imageCornerX, i.imageCornerY, i.imageWidth, i.imageHeight);
  }
  
}
