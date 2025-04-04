class Button {
   float x, y, size;
  
  Button(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void display(boolean isRunning) {
    fill(164, 74, 63);
    noStroke();
    circle(x, y, size);
    
    fill(212,224,155);
    noStroke();
    
    if (!isRunning) {
      // Tegn trekant
      float tSize = size * 0.4;
      triangle(x - tSize / 2, y - tSize / 2, x - tSize / 2, y + tSize / 2, x + tSize / 2, y);
    } else {
      // Tegn to linjer
      float barW = size * 0.15;
      float barH = size * 0.5;
      rect(x - barW * 1.5, y - barH / 2, barW, barH);
      rect(x + barW * 0.5, y - barH / 2, barW, barH);
    }
  }

  boolean isClicked(float mx, float my) {
    return dist(mx, my, x, y) < size / 2;
  }
}
