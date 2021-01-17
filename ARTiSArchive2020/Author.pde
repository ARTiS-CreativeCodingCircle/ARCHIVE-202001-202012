enum Author {
  ohayota("ohayota", "ohayota", "高度ICT領域 修士1年", new Role[]{ Role.manage, Role.write, Role.layout }),
  tomoka("Tomoka", "tomoka", "高度ICT領域 修士1年", new Role[]{ Role.write, Role.layout }),
  ikano("Ikanoshiokara", "ikanoshiokara", "複雑系コース 学部2年", new Role[]{ Role.write }),
  lowene("ろうえね", "lowene", "知能システムコース 学部2年", new Role[]{ Role.check }),
  akitch("あきっち", "akitch", "学部1年", new Role[]{ Role.write, Role.layout }),
  eboshi("eboshidori", "eboshidori", "学部1年", new Role[]{ Role.write, Role.layout });
  
  private Author(String name, String nameLower, String belonging, Role[] roles) {
    this.name = name;
    this.nameLower = nameLower;
    this.belonging = belonging;
    this.roles = roles;
  }
  
  public String getName() {
    return name;
  }
  public String getNameLower() {
    return nameLower;
  }
  public String getBelonging() {
    return belonging;
  }
  public String getRole() {
    String role = roles[0].getName();
    for (int i = 1; i < roles.length; i++) {
      role += "／" + roles[i].getName();
    }
    return role;
  }
  
  private final String name;
  private final String nameLower;
  private final String belonging;
  private final Role[] roles;
}

enum Role {
  manage("制作進行"),
  write("執筆"),
  layout("レイアウト"),
  check("原稿チェック");
  
  private Role(String name) {
    this.name = name;
  }
  
  public String getName() {
    return name;
  }
  
  private final String name;
}
