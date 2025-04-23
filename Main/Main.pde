import cassette.audiofiles.SoundFile;

Pomodoro p;                  // Objekt af Pomodoro-klassen, styrer timer-logikken
Button startStopButton;     // Knap til at starte og stoppe timeren
StudyTime studyTime;        // Objekt der holder styr på, hvor mange cyklusser der er gået
boolean isRunning = false;  // Boolean der angiver om timeren er aktiv
SoundFile noise;            // Lydfil der afspilles ved aktivitet

void setup() {
  fullScreen();                     // Starter appen i fuld skærm
  textSize(50);                     // Indstiller tekststørrelsen

  p = new Pomodoro();               // Initialiserer Pomodoro-objektet
  startStopButton = new Button(width / 2, height / 2, width * 0.8); // Placering og størrelse for knappen
  studyTime = new StudyTime();     // Initialiserer studie-tids-trackeren
  noise = new SoundFile(this, "WN.mp3"); // Indlæser lydfil
}

void draw() {
  background(246, 244, 210);       // Baggrundsfarve

  p.calcTime();                    // Opdaterer timeren
  p.displayTime();                 // Viser nedtælling som tekst
  p.displayCircle();               // Tegner visuel timer-cirkel

  studyTime.update(p.cycle);      // Opdaterer cyklusserne hvis nødvendigt
  startStopButton.display(isRunning); // Tegner knappen
  studyTime.display();             // Viser hvor mange pomodoro der er gået
}

void mousePressed() {
  if (startStopButton.isClicked(mouseX, mouseY)) {
    isRunning = !isRunning;         // Skifter mellem start og stop
    p.toggleTimer(isRunning);       // Starter eller stopper Pomodoro-timeren
  }
  if (isRunning) {
    noise.loop();                   // Afspiller baggrundslyd under fokus
  } else {
    noise.stop();                   // Stopper lyden når pausen starter
  }
}
