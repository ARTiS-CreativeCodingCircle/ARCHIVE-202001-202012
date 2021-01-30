public class SectionCover extends Page {
  
  Author author;
  String text;
  Image backImage;
  color textColor;
  
  ClearRect[] clearRects;
  
  public SectionCover(Section section, PImage backImage, String text, color textColor) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.backImage = new Image(backImage);
    this.text = text;
    this.textColor = textColor;
  }
  
  public SectionCover(Section section, PImage backImage, String text, color textColor, ClearRect[] clearRects) {
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
    textAlign(LEFT);
    
    textFont(createFont(TextType.author.getFontName(), TextType.author.getFontSize()));
    text(section.getSectionNumber(), 100, 290);
    //textFont(createFont(TextType.belonging.getFontName(), TextType.belonging.getFontSize()));
    //text(author.getBelonging(), 100, 340);
    
    textFont(createFont(TextType.main.getFontName(), TextType.main.getFontSize()));
    text(text, 100, 620);
  }
  
}
