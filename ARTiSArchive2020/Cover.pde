public class Cover extends Page {
  
  Author author;
  String text;
  PImage image;
  PShape logo;
  PGraphics pg;
  PGraphics cpg;
  
  public Cover(Section section) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.image = loadImage(section.getPath() + "image.png");
    this.logo = loadShape(section.getPath() + "logo.svg");
    cpg = createGraphics(int(WIDTH), int(HEIGHT));
    cpg.beginDraw();
    //cpg.blendMode(DIFFERENCE);
    cpg.background(0, 120);
    cpg.fill(255);
    cpg.textFont(createFont("Bahnschrift", 220));
    cpg.textSize(220);
    cpg.push();
    cpg.textAlign(LEFT, TOP);
    cpg.rotate(-HALF_PI);
    cpg.translate(-HEIGHT-28, -38);
    cpg.text("ARCHIVE", 0, 0);
    cpg.pop();
    cpg.textSize(54);
    cpg.noStroke();
    cpg.rect(-7, 257, 262, 23);
    cpg.rect(262, 257, 209, 23);
    cpg.rect(478, 257, WIDTH, 23);
    cpg.text("2020.01", 172, 258);
    cpg.text("2020.12", 388, 314);
    cpg.shape(logo, 140, HEIGHT-(WIDTH-360)/2, WIDTH-360, (WIDTH-360)/2);
    cpg.endDraw();
    pg = createGraphics(int(WIDTH), int(HEIGHT));
    pg.beginDraw();
    pg.image(image, -220, 0, convertImageWidth(image, HEIGHT), HEIGHT);
    pg.image(cpg, 0, 0);
    pg.endDraw();
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(pg, 0, 0);
  }
  
}

public class BackCover extends Page {
  
  Author author;
  String text;
  PImage image;
  PGraphics pg;
  PGraphics cpg;
  
  public BackCover(Section section) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.image = loadImage(section.getPath() + "image.png");
    cpg = createGraphics(int(WIDTH), int(HEIGHT));
    cpg.beginDraw();
    cpg.background(0, 120);
    cpg.fill(255);
    cpg.noStroke();
    cpg.rect(-1, 257, WIDTH+2, 23);
    cpg.endDraw();
    pg = createGraphics(int(WIDTH), int(HEIGHT));
    pg.beginDraw();
    pg.image(image, -convertImageWidth(image, HEIGHT)+WIDTH+85, 0, convertImageWidth(image, HEIGHT), HEIGHT);
    pg.image(cpg, 0, 0);
    pg.endDraw();
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(pg, 0, 0);
  }
  
}
