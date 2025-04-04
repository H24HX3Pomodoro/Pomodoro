Pomodoro p;
Button startStopButton;
boolean isRunning = false;

void setup() {
  fullScreen();
  textSize(50);

  p = new Pomodoro();
 startStopButton = new Button(width / 2, height / 2, width*0.8);
}

void draw() {
  background(246,244,210);

  p.calcTime();
  p.displayTime();
  p.displayCycle();
  p.displayCircle();

  startStopButton.display(isRunning);
}

void mousePressed() {
  if (startStopButton.isClicked(mouseX, mouseY)) {
    isRunning = !isRunning;
    p.toggleTimer(isRunning);
  }
}
