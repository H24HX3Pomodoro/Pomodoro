class StudyTime {
  int displayedCycles = 0;

  void update(int pomodoroCycle) {
    displayedCycles = pomodoroCycle;  // Opdaterer antal gennemførte cyklusser
  }

  void display() {
    int perRow = 4;                        // Hvor mange cirkler per række
    float size = width / 10;              // Størrelsen på hver cirkel
    float spacing = width / (perRow + 1); // Afstand mellem cirkler
    float startY = height - (height - size); // Y-placering

    fill(164, 74, 63);
    noStroke();

    for (int i = 0; i < displayedCycles; i++) {
      int row = i / perRow;
      int col = i % perRow;
      float x = spacing * (col + 1);
      float y = startY + row * (size + size/2);

      circle(x, y, size);  // Tegner en cirkel for hver gennemført pomodoro
    }
  }
}
