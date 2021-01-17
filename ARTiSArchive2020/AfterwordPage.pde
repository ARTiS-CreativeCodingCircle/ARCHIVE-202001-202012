public class AfterwordPage extends Page {
  
  private TextType textType;
  private String title;
  
  private AuthorBlock[] authorBlocks;
  
  public AfterwordPage() {
    super(Section.afterword);
    this.title = section.getSectionNumber();
    this.authorBlocks = generateAuthorBlocks();
  }
  
  AuthorBlock[] generateAuthorBlocks() {
    // 1列目1人目
    AuthorBlock ohayota = new AuthorBlock(section, Author.ohayota, marginHorizontal, marginVertical+titleBottomPadding, 166, 206);
    // 1列目2人目
    AuthorBlock akitch = new AuthorBlock(section, Author.akitch, marginHorizontal, marginVertical+titleBottomPadding+260, 94, 134);
    // 1列目3人目
    AuthorBlock ikano = new AuthorBlock(section, Author.ikano, marginHorizontal, marginVertical+titleBottomPadding+430, 140, 162);
    // 2列目1人目
    AuthorBlock tomoka = new AuthorBlock(section, Author.tomoka, int(WIDTH/2+marginHorizontal*0.2), marginVertical+titleBottomPadding, 166, 206);
    // 2列目2人目
    AuthorBlock eboshi = new AuthorBlock(section, Author.eboshi, int(WIDTH/2+marginHorizontal*0.2), marginVertical+titleBottomPadding+260, 94, 116);
    // 2列目3人目
    AuthorBlock lowene = new AuthorBlock(section, Author.lowene, int(WIDTH/2+marginHorizontal*0.2), marginVertical+titleBottomPadding+430, 140, 180);
    return new AuthorBlock[]{ ohayota, tomoka, ikano, akitch, eboshi, tomoka, lowene };
  }
  
  public void draw() {
    super.draw();
    
    // タイトル部分の表示
    textType = TextType.title;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    text(title, marginHorizontal, marginVertical);
    
    // 各メンバーのあとがきとかとか表示
    for (AuthorBlock block: authorBlocks) {
      block.draw();
    }
  }
  
}

class AuthorBlock {
  
  int cornerX;
  int cornerY;
  String role;
  String authorName;
  String comment;
  String page; // 担当したページ一覧
  String account;
  PImage image;
  TextBlock textBlock; // 各種アカウントを表示する部分
  TextType textType;
  
  int accountOffsetY;
  int pageOffsetY;
  
  PGraphics pg;
  
  public AuthorBlock(Section section, Author author, int cornerX, int cornerY, int accountOffsetY, int pageOffsetY) {
    this.cornerX = cornerX;
    this.cornerY = cornerY;
    this.authorName = author.getName();
    this.role = author.getRole();
    this.image = loadImage(section.getPath() + author.getNameLower() + ".png");
    this.comment = txtToString(section.getPath() + author.getNameLower() + ".txt");
    this.page = txtToString(section.getPath() + author.getNameLower() + "_page.txt");
    this.account = txtToString(section.getPath() + author.getNameLower() + "_account.txt");
    this.accountOffsetY = accountOffsetY;
    this.pageOffsetY = pageOffsetY;
  }
  
  public void draw() {
    
    pg = createGraphics(60, 60);
    pg.beginDraw();
    pg.noStroke();
    pg.fill(150);
    pg.ellipse(pg.width/2, pg.height/2, 48, 48);
    pg.filter(BLUR, 2);
    pg.endDraw();
    
    imageMode(CORNER);
    image(pg, -4+cornerX, cornerY);
    image(image, -4+cornerX+6, cornerY+6, 48, 48);
    
    // 著者名と役割の表示
    textAlign(LEFT, TOP);
    fill(0);
    textType = TextType.title;
    textFont(createFont(textType.getFontName(), 18));
    text(authorName, cornerX+60+4, cornerY+8);
    textType = TextType.small;
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    text(role, cornerX+60+4, cornerY+34);
    
    // ひとことの表示
    textType = TextType.main;
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    text(comment, cornerX, cornerY+68, WIDTH/2-int(marginHorizontal*1.2), 120);
    
    // アカウントの表示
    textType = TextType.section;
    textFont(createFont(textType.getFontName(), 12));
    fill(0);
    text(account, cornerX, cornerY+accountOffsetY, WIDTH/2-int(marginHorizontal*1.2), 120);
    
    // 担当ページの表示
    textType = TextType.section;
    textFont(createFont(textType.getFontName(), 10));
    fill(0);
    text(page, cornerX, cornerY+pageOffsetY, WIDTH/2-int(marginHorizontal*1.2), 120);
    
    // 各種アカウントの表示
    if (textBlock != null) {
      textBlock.draw();
    }
  }
  
}
