public class PersonalCoverLeft extends Page {
  
  String sectionNumber;
  Image backImage;
  color textColor;
  
  public PersonalCoverLeft(Section section, PImage backImage, color textColor) {
    super(section);
    this.sectionNumber = section.getSectionNumber();
    this.backImage = new Image(backImage);
    this.textColor = textColor;
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(backImage.image, backImage.imageCornerX-1, backImage.imageCornerY-1, backImage.imageWidth+2, backImage.imageHeight+2);
    
    textFont(createFont(TextType.section.getFontName(), TextType.section.getFontSize()));
    textAlign(RIGHT);
    fill(textColor);
    text(sectionNumber, width-100, 290);
  }
  
}

public class PersonalCoverRight extends Page {
  
  Author author;
  String text;
  Image backImage;
  color textColor;
  
  public PersonalCoverRight(Section section, PImage backImage, String text, color textColor) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.backImage = new Image(backImage);
    this.text = text;
    this.textColor = textColor;
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(backImage.image, backImage.imageCornerX-1, backImage.imageCornerY-1, backImage.imageWidth+2, backImage.imageHeight+2);
    
    fill(textColor);
    
    textFont(createFont(TextType.author.getFontName(), TextType.author.getFontSize()));
    text(author.getName(), 100, 290);
    textFont(createFont(TextType.belonging.getFontName(), TextType.belonging.getFontSize()));
    text(author.getBelonging(), 100, 340);
    
    textFont(createFont(TextType.main.getFontName(), TextType.main.getFontSize()));
    text(text, 100, 620);
  }
  
}
