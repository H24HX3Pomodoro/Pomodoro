import ddf.minim.*;

Pomodoro p;
Button startStopButton;
StudyTime studyTime;
boolean isRunning = false;
Minim noise;
Minim bird;
AudioPlayer one;
AudioPlayer two;

void setup() {
  fullScreen();
  textSize(50);

  p = new Pomodoro();
  startStopButton = new Button(width / 2, height / 2, width * 0.8);
  studyTime = new StudyTime();
  noise = new Minim(this);
  bird = new Minim(this);
  one = noise.loadFile("WN.mp3");
  two = bird.loadFile("bird.mp3");
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
    // Timer starts - play white noise
    one.play();  // Loop the noise sound
    two.pause();   // Stop the bird sound
  } else {
    // Timer stops - stop white noise and play bird sound
    one.pause();  // Stop the noise
    two.loop();   // Start bird sound when paused
  }
}
