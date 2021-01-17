public class ContentsTable extends Page {
  
  String sectionNumber;
  Image backImage;
  color textColor;
  
  public ContentsTable(PImage backImage, color textColor) {
    super(Section.contents);
    this.sectionNumber = section.getSectionNumber();
    this.backImage = new Image(backImage);
    this.textColor = textColor;
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(backImage.image, backImage.imageCornerX, backImage.imageCornerY, backImage.imageWidth+1, backImage.imageHeight+1);
    
    //textFont(createFont(TextType.section.getFontName(), TextType.section.getFontSize()));
    //textAlign(RIGHT);
    //fill(textColor);
    //text(sectionNumber, WIDTH-100, 290);
  }
  
}
