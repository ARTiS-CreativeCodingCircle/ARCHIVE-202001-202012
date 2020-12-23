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
  
  // 自己紹介テキスト用のテキストボックスも必要
  
  Author author;
  
  public PersonalCoverRight(Author author, PImage image) {
    super(new Image(image));
    this.author = author;
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    Image i = images[0];
    image(i.image, i.imageCornerX, i.imageCornerY, i.imageWidth, i.imageHeight);
    
    textFont(createFont(TextType.author.getFontName(), TextType.author.getFontSize()));
    text(author.getName(), 100, 200);
    textFont(createFont(TextType.belonging.getFontName(), TextType.belonging.getFontSize()));
    text(author.getBelonging(), 100, 250);
  }
  
}
