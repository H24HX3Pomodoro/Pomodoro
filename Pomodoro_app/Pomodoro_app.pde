int studieTid = 25 * 60;  // en pomodoro
int kortPause = 5 * 60;  // kort pause
int langPause = 30 * 60;  // lang pause
boolean isPause = false;

int timer = studieTid;
int sidsteMillis;

void setup() {
  fullScreen();
  sidsteMillis = millis();
}

void draw() {
  background(246, 244, 210); // Baggrund
  int currentMillis = millis();
  int tidGået = (currentMillis - sidsteMillis) / 1000;

  if (tidGået > 0) {
    timer = timer - tidGået;
    sidsteMillis = currentMillis; }

    if (timer <= 0) {
      if (isPause) {
        isPause = false;
      } else {
        isPause = true;
        timer = kortPause;
      }
    }

    // tegner pomodoroen 
    fill(164, 74, 63);
    noStroke();
    ellipse(width / 2, height / 2, width * 0.6, width * 0.6);

    // timeren over tomaten
    fill(164, 74, 63);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(formatTid(timer), width / 2, height / 4);
  }
  
// gør så tiden er mm:ss
String formatTid(int seconds) {
  int minutes = seconds / 60;
  int secs = seconds % 60;
  return nf(minutes, 2) + ":" + nf(secs, 2);
}
