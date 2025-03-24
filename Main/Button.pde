class Button {
  float x, y, size;
  String label;

  Button(float x, float y, float size, String label) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.label = label;
  }

  void display() {
    fill(255);
    stroke(0);
    strokeWeight(5);
    ellipse(x, y, size, size);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(label, x, y);
  }

  boolean isClicked(float mx, float my) {
    return dist(mx, my, x, y) < size / 2;
  }

  void setText(String newText) {
    label = newText;
  }
}
