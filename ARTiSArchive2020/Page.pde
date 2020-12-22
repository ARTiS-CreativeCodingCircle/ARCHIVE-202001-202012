public class Page {
  
  public Page() {
    
  }
  
  void draw() {
    if (isVisibleGrid) {
      imageMode(CENTER);
      image(grid, width/2, height/2, areaWidth, areaHeight);
    }
  }
  
}
