Pomodoro p;
Button startStopButton;
boolean isRunning = false;

void setup() {
  fullScreen();
  textSize(50);

  p = new Pomodoro();
  startStopButton = new Button(width / 2, height / 2, width * 0.3, "Start");
}

void draw() {
  background(246,244,210);

  p.calcTime();
  p.displayTime();
  p.displayCycle();
  p.displayCircle();

  startStopButton.display();
}

void mousePressed() {
  if (startStopButton.isClicked(mouseX, mouseY)) {
    isRunning = !isRunning;
    startStopButton.setText(isRunning ? "Stop" : "Start");
    p.toggleTimer(isRunning);
  }
}
