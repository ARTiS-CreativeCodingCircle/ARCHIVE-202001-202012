public class Page {
  
  Section section;

  public Page(Section section) {
    this.section = section;
  }
  
  public void draw() {
    if (isVisibleGrid) {
      imageMode(CENTER);
      image(grid, width/2, height/2, areaWidth, areaHeight);
    }
  }
  
}
