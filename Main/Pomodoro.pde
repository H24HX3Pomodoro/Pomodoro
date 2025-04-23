class Pomodoro {
  int totalSeconds = 25 * 60;       // Antal sekunder i én pomodoro
  int secondsLeft = totalSeconds;   // Tid tilbage i nuværende session
  int cycle = 3;                    // Antal gennemførte pomodoros
  boolean isBreak = false;          // Om det er pause eller arbejde
  boolean isRunning = false;        // Om timeren er aktiv
  int startTime = 0;                // Hvornår timeren blev startet
  
  void calcTime() {
    if (isRunning) {
      int elapsedTime = (millis() - startTime) / 1000;     // Tid der er gået i sekunder
      secondsLeft = totalSeconds - elapsedTime;            // Hvor meget tid der er tilbage

      if (secondsLeft <= 0) {                              // Hvis tiden er gået
        if (!isBreak) {
          cycle++;                                         // Øger cyklus hvis det var en arbejdsperiode
          studyTime.update(cycle);
        }
        isBreak = !isBreak;                                // Skifter mellem arbejde og pause
        if (isBreak) {
          totalSeconds = (cycle % 4 == 0) ? 30 * 60 : 5 * 60; // Længere pause efter 4 cyklusser
        } else {
          totalSeconds = 25 * 60;                          // Ellers ny arbejdsperiode
        }

        secondsLeft = totalSeconds;                        // Nulstiller sekunderne
        startTime = millis();                              // Nulstiller starttid
      }
    }
  }

  void displayTime() {
    int minutes = secondsLeft / 60;
    int seconds = secondsLeft % 60;
    fill(164, 74, 63);
    textAlign(CENTER, CENTER);
    text(minutes + ":" + nf(seconds, 2), width / 2, height / 4); // Viser minutter og sekunder
  }

  void displayCycle() {
    textSize(40);
    text("Pomodoro: " + cycle, width / 2, height / 6); // Til intern brug: viser antal cyklusser
  }

  void displayCircle() {
    fill(164, 74, 63);
    noStroke();
    circle(width / 2, height / 2, width * 0.8); // Tegner visuel timer (stor cirkel)
  }

  void toggleTimer(boolean state) {
    isRunning = state;
    if (isRunning) {
      startTime = millis() - (totalSeconds - secondsLeft) * 1000; // Justerer starttid hvis pauset
    }
  }
}
