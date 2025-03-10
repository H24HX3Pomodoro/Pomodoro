class Pomodoro {
  int sek = 59;
  int min = 24;
  int startFrame = 0;

  Pomodoro() {
    startFrame= frameCount;
  }
  void calcTime() {
    if ((frameCount-startFrame)% 60 == 0) {
      sek--;
    }
    if (sek<0){
     min--; 
    }
  }
  void displayTime(){
   text(min+":"+sek, 100,100);
  }
}
