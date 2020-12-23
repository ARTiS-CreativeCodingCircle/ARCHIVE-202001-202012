public class PersonalCoverLeft extends Page {
  
  String sectionNumber;
  Image backImage;
  
  public PersonalCoverLeft(PImage backImage) {
    super();
    this.backImage = new Image(backImage);
    sectionNumber = "P.4";
  }
  
  public PersonalCoverLeft(Image backImage) {
    super();
    this.backImage = backImage;
    sectionNumber = "P.4";
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(backImage.image, backImage.imageCornerX, backImage.imageCornerY, backImage.imageWidth, backImage.imageHeight);
    
    textFont(createFont(TextType.section.getFontName(), TextType.section.getFontSize()));
    textAlign(RIGHT);
    text(sectionNumber, width-100, 290);
  }
  
}

public class PersonalCoverRight extends Page {
  
  Author author;
  String text;
  Image backImage;
  
  public PersonalCoverRight(Author author, PImage backImage, String text) {
    super();
    this.author = author;
    this.backImage = new Image(backImage);
    this.text = text;
  }
  
  public PersonalCoverRight(Author author, Image backImage, String text) {
    super();
    this.author = author;
    this.backImage = backImage;
    this.text = text;
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(backImage.image, backImage.imageCornerX, backImage.imageCornerY, backImage.imageWidth, backImage.imageHeight);
    
    textFont(createFont(TextType.author.getFontName(), TextType.author.getFontSize()));
    text(author.getName(), 100, 290);
    textFont(createFont(TextType.belonging.getFontName(), TextType.belonging.getFontSize()));
    text(author.getBelonging(), 100, 340);
    
    textFont(createFont(TextType.main.getFontName(), TextType.main.getFontSize()));
    text(text, 100, 620);
  }
  
}
