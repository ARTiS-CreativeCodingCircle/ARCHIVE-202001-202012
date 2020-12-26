class ClearRect {
  
  int cornerX;
  int cornerY;
  int rectW;
  int rectH;
  color rectColor;
  
  ClearRect(int cornerX, int cornerY, int rectW, int rectH, color rectColor) {
    this.cornerX = cornerX;
    this.cornerY = cornerY;
    this.rectW = rectW;
    this.rectH = rectH;
    this.rectColor = rectColor;
  }
  
  void draw() {
    fill(rectColor);
    rectMode(CORNER);
    noStroke();
    rect(cornerX, cornerY, rectW, rectH);
  }
  
}
