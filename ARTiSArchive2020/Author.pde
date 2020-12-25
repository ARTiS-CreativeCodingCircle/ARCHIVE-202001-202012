enum Author {
  ohayota("ohayota", "高度ICT領域 修士1年"),
  tomoka("Tomoka", "高度ICT領域 修士1年"),
  ikano("Ikanoshiokara", "複雑系コース 学部2年"),
  lowene("ろうえね", "知能システムコース 学部2年"),
  akitch("あきっち", "学部1年"),
  eboshi("eboshidori", "学部1年");
  
  private Author(String name, String belonging) {
    this.name = name;
    this.belonging = belonging;
  }
  
  public String getName() {
    return name;
  }
  public String getBelonging() {
    return belonging;
  }
  
  private final String name;
  private final String belonging;
}
