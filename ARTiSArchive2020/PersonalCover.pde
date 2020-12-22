public class PersonalCover extends Page {
  
  public PersonalCover(Image[] images) {
    super(images);
  }
  
  void draw() {
    image(images[0].image, 0, 0, width, height);
  }
  
}
