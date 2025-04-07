class Pomodoro {
  int totalSeconds = 25 * 60;
  int secondsLeft = totalSeconds;
  int cycle = 4;
  boolean isBreak = false;
  boolean isRunning = false;
  int startTime = 0;
  Pomodoro() {
  }

  void calcTime() {
    if (isRunning) {

      int elapsedTime = (millis() - startTime) / 1000;
      secondsLeft = totalSeconds - elapsedTime;

      if (secondsLeft <= 0) {
        if (!isBreak) {
          cycle++;
          studyTime.update(cycle);
        }
        isBreak = !isBreak;
        if (isBreak) {
          totalSeconds = (cycle % 4 == 0) ? 30 * 60 : 5 * 60;
        } else {
          totalSeconds = 25 * 60;
        }

        secondsLeft = totalSeconds;
        startTime = millis();  // Reset the start time
      }
    }
  }

  void displayTime() {
    int minutes = secondsLeft / 60;
    int seconds = secondsLeft % 60;
    fill(164, 74, 63);
    textAlign(CENTER, CENTER);
    text(minutes + ":" + nf(seconds, 2), width / 2, height / 4);
  }

  void displayCycle() {
    textSize(40);
    text("Pomodoro: " + cycle, width / 2, height / 6);
  } //Funktion for mit eget overblik

  void displayCircle() {
    fill(164, 74, 63);
    noStroke();
    circle(width / 2, height / 2, width * 0.8);
  }

  void toggleTimer(boolean state) {
    isRunning = state;

    if (isRunning) {
      startTime = millis() - (totalSeconds - secondsLeft) * 1000;
    }
  }
}
