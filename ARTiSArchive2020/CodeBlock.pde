public class CodeBlock {
  
  TextType textType;
  
  String code;
  int blockCornerX;
  int blockCornerY;
  int blockWidth;
  int blockHeight;
  int codeCornerX;
  int codeCornerY;
  int codeWidth;
  int codeHeight;
  
  public CodeBlock(String code, int blockCornerX, int blockCornerY, int blockWidth, int blockHeight) {
    this.code = code;
    this.blockCornerX = blockCornerX;
    this.blockCornerY = blockCornerY;
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.codeCornerX = blockCornerX+8;
    this.codeCornerY = blockCornerY+8;
    this.codeWidth = blockWidth-16;
    this.codeHeight = blockHeight-16;
  }
  
  public void draw() {
    // コード背景のグレーエリア
    fill(220);
    noStroke();
    rect(blockCornerX, blockCornerY, blockWidth, blockHeight);
    
    // コードの表示
    textType = TextType.code;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    // 自動改行（日本語の場合は改行位置に半角スペースが必要）
    textLeading(12.5);
    text(code, codeCornerX, codeCornerY, codeWidth, codeHeight);
  }
  
}
