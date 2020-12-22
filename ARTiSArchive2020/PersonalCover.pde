public class PersonalCoverLeft extends Page {
  
  public PersonalCoverLeft(PImage image) {
    super(new Image(image));
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    Image i = images[0];
    image(i.image, i.imageCornerX, i.imageCornerY, i.imageWidth, i.imageHeight);
  }
  
}

public class PersonalCoverRight extends Page {
  
  public PersonalCoverRight(PImage image) {
    super(new Image(image));
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    Image i = images[0];
    image(i.image, i.imageCornerX, i.imageCornerY, i.imageWidth, i.imageHeight);
  }
  
}
