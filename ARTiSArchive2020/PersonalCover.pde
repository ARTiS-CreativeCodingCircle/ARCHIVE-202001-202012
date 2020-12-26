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
    image(backImage.image, backImage.imageCornerX, backImage.imageCornerY, backImage.imageWidth+1, backImage.imageHeight+1);
    
    textFont(createFont(TextType.section.getFontName(), TextType.section.getFontSize()));
    textAlign(RIGHT);
    fill(textColor);
    text(sectionNumber, WIDTH-100, 290);
  }
  
}

public class PersonalCoverRight extends Page {
  
  Author author;
  String text;
  Image backImage;
  color textColor;
  
  ClearRect[] clearRects;
  
  public PersonalCoverRight(Section section, PImage backImage, String text, color textColor) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.backImage = new Image(backImage);
    this.text = text;
    this.textColor = textColor;
  }
  
  public PersonalCoverRight(Section section, PImage backImage, String text, color textColor, ClearRect[] clearRects) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.backImage = new Image(backImage);
    this.text = text;
    this.textColor = textColor;
    this.clearRects = clearRects;
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(backImage.image, backImage.imageCornerX, backImage.imageCornerY, backImage.imageWidth+1, backImage.imageHeight+1);
    
    if (clearRects != null) {
      for (ClearRect clearRect: clearRects) {
        clearRect.draw();
      }
    }
    
    fill(textColor);
    textAlign(LEFT, TOP);
    
    textFont(createFont(TextType.author.getFontName(), TextType.author.getFontSize()));
    text(author.getName(), 100, 250);
    textFont(createFont(TextType.belonging.getFontName(), TextType.belonging.getFontSize()));
    text(author.getBelonging(), 100, 340);
    
    textFont(createFont(TextType.main.getFontName(), TextType.main.getFontSize()));
    text(text, 100, 620);
  }
  
}
