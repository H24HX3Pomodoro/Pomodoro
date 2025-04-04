class Pomodoro {
  int sek = 0;
  int min = 25;
  int startFrame = 0;
  int cycle = 0;
  boolean isBreak = false;

  Pomodoro() {
    startFrame = frameCount;
  }

  void calcTime() {
    if (isRunning) {
      if ((frameCount - startFrame) % 60 == 0) {
        sek--;
      }

      if (sek < 0) {
        if (min > 0) {
          min--;
          sek = 59;
        } else {
          cycle++;
          isBreak = !isBreak; // Skift mellem pause og arbejde
          if (isBreak) {
            min = (cycle % 4 == 0) ? 30 : 5; // Lang pause efter 4 cycles
          } else {
            min = 25;
          }
          sek = 0;
        }
      }
    }
  }

  void displayTime() {
    fill(164, 74, 63);
    textAlign(CENTER, CENTER);
    text(min + ":" + nf(sek, 2), width / 2, height / 4);
  }

  void displayCycle() {
    textSize(40);
    text("Pomodoro: " + cycle, width / 2, height / 6);
  }

  void displayCircle() {
    fill(164, 74, 63);
    noStroke();
    circle(width / 2, height / 2, width * 0.8);
  }

  void toggleTimer(boolean state) {
    isRunning = state;
    startFrame = frameCount;
  }
}
