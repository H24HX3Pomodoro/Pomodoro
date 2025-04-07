class StudyTime {
  int displayedCycles = 4;

  void update(int pomodoroCycle) {
    displayedCycles = pomodoroCycle;
  }

  void display() {
    int perRow = 5;
    float size = width / 10;
    float spacing = width / (perRow + 1);
    float startY = height - (height-size);

    fill(164, 74, 63);
    noStroke();

    for (int i = 0; i < displayedCycles; i++) {
      int row = i / perRow;
      int col = i % perRow;
      float x = spacing * (col + 1);
      float y = startY + row * (size + size/2);

      circle(x, y, size);
    }
  }
}
