import cassette.audiofiles.SoundFile;

Pomodoro p;
Button startStopButton;
StudyTime studyTime;
boolean isRunning = false;
SoundFile noise;

void setup() {
  fullScreen();
  textSize(50);

  p = new Pomodoro();
  startStopButton = new Button(width / 2, height / 2, width * 0.8);
  studyTime = new StudyTime();
  noise = new SoundFile(this, "WN.mp3");
}

void draw() {
  background(246, 244, 210);

  p.calcTime();
  p.displayTime();
  p.displayCircle();

  studyTime.update(p.cycle);
  startStopButton.display(isRunning);
  studyTime.display();
}

void mousePressed() {
  if (startStopButton.isClicked(mouseX, mouseY)) {
    isRunning = !isRunning;
    p.toggleTimer(isRunning);
  }
  if (isRunning) {
    noise.loop();
    
  } else {
    noise.stop();
  }
}
