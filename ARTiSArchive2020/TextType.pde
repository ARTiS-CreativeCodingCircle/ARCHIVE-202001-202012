enum TextType {
  author("NotoSansCJKjp-Regular", 48),
  title("NotoSansCJKjp-Regular", 22),
  belonging("NotoSansCJKjp-Regular", 16),
  main("NotoSerifCJKjp-Regular", 12),
  code("NotoSerifCJKjp-Regular", 10.5);
  
  private TextType(String fontName, float fontSize) {
    this.fontName = fontName;
    this.fontSize = fontSize;
  }
  
  public String getFontName() {
    return fontName;
  }
  public float getFontSize() {
    return fontSize;
  }
  
  private final String fontName;
  private final float fontSize;
}
