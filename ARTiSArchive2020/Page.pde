public class Page {
  
  Section section;

  public Page(Section section) {
    this.section = section;
  }
  
  public void draw() {
    if (isVisibleGrid) {
      imageMode(CENTER);
      image(grid, WIDTH/2, HEIGHT/2, areaWidth, areaHeight);
    }
  }
  
}
