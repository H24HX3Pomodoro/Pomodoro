class Pomodoro {
  int sek = 5;
  int min = 0;
  int startFrame = 0;
  int cycle = 0;

  Pomodoro() {
    startFrame= frameCount;
  }
  void calcTime() {
    if ((frameCount-startFrame)% 60 == 0 && min>=0) {
      sek--;
    }
    if (sek<0 && min>=0){
     min--; 
    } if(min==0 && sek==0) {
      cycle++; //fucking programmet tilføjer 60 cykluser jeg dræber mig selv
    }
  }
  void displayTime(){
   text(min+":"+sek, 100,100);
  }
  void displayPomodoro(){
   text("Pomodoro"+cycle,100,200); 
  }
}
