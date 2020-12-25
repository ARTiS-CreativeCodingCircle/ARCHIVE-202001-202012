public class CaptionTextBlock extends TextBlock {
  
  TextType textType;
  
  String text;
  int blockCenterX;
  int blockCenterY;
  int blockWidth;
  int blockHeight;
  int textCornerX;
  int textCornerY;
  int textWidth;
  int textHeight;
  
  int padding = 8;
  
  public CaptionTextBlock(String text, int blockCenterX, int blockCenterY, int blockWidth, int blockHeight) {
    super();
    this.text = text;
    this.blockCenterX = blockCenterX;
    this.blockCenterY = blockCenterY;
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.textCornerX = blockCenterX;
    this.textCornerY = blockCenterY + padding;
    this.textWidth = blockWidth;
    this.textHeight = blockHeight - padding*2;
  }
  
  public void draw() {
    // テキストの表示
    textType = TextType.small;
    textAlign(CENTER, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    // 自動改行（日本語の場合は改行位置に半角スペースが必要）
    textLeading(20);
    text(text, textCornerX, textCornerY, textWidth, textHeight);
  }
  
}
