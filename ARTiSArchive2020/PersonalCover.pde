public class PersonalCoverLeft extends Page {
  
  String sectionNumber;
  
  public PersonalCoverLeft(PImage image) {
    super(new Image(image));
    sectionNumber = "P.4";
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    Image i = images[0];
    image(i.image, i.imageCornerX, i.imageCornerY, i.imageWidth, i.imageHeight);
    
    textFont(createFont(TextType.section.getFontName(), TextType.section.getFontSize()));
    textAlign(RIGHT);
    text(sectionNumber, width-100, 290);
  }
  
}

public class PersonalCoverRight extends Page {
  
  // 自己紹介テキスト用のテキストボックスも必要
  
  Author author;
  
  String text;
  
  public PersonalCoverRight(Author author, PImage image, String text) {
    super(new Image(image));
    this.author = author;
    this.text = text;
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    Image i = images[0];
    image(i.image, i.imageCornerX, i.imageCornerY, i.imageWidth, i.imageHeight);
    
    textFont(createFont(TextType.author.getFontName(), TextType.author.getFontSize()));
    text(author.getName(), 100, 290);
    textFont(createFont(TextType.belonging.getFontName(), TextType.belonging.getFontSize()));
    text(author.getBelonging(), 100, 340);
    
    textFont(createFont(TextType.main.getFontName(), TextType.main.getFontSize()));
    text(text, 100, 620);
    
  }
  
}