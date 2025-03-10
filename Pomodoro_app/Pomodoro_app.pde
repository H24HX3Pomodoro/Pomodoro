Pomodoro p;

void setup() {
  textSize(20);
  size(600, 600);
 
}

void draw() {
  background(0);
 if(p!= null ){
  p.calcTime();
  p.displayTime();
  p.displayPomodoro();
 }
}

void mousePressed(){
 p = new Pomodoro(); 
}
