enum TextType {
  section("Bahnschrift", 48),
  author("NotoSansCJKjp-Bold", 48),
  title("NotoSansCJKjp-Bold", 22),
  belonging("NotoSansCJKjp-Bold", 16),
  main("NotoSerifCJKjp-Regular", 12),
  code("NotoMono", 10);
  
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
