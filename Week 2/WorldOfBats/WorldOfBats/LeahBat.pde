class LeahBat extends Bat
{
  
  PingEcho target;
  boolean triedRight = false;
  boolean triedLeft = true;
  
  boolean searching = true;
  boolean hunting = false;
  boolean closing = false;
  
  
  void initialiseAppearance()
  {
    setWingAppearance("11110100");
    setBodyAppearance("00010000");
    setColour(120, 180, 255);
  }

  void manoeuvre()
  {
    if(this.searching){
      search();
    }
    if(this.hunting){
      hunt();
    }
    if(this.closing){
      close();
    }

  }
  
  void search(){
    setSpeed(0.3);
    PingEcho ping = narrowPing();
    turnRight();
    if(ping.distance != -1){
      this.searching = false;
      this.hunting = true;
    }
  }
  
  void hunt(){
    setSpeed(0.5);
    PingEcho ping = narrowPing();
    if(ping.distance <= 60){
      this.hunting = false;
      this.closing = true;
    }
  }
  
  void close(){
    this.closing = false;
    this.searching = true;
  }
  
    
  
  void tryRight(PingEcho control){
    setSpeed(0.3);
    turnRight();
    PingEcho check = widePing();
    if(check.distance > control.distance){
      turnLeft();
      this.triedRight = true;
    }
  }
  
  void tryLeft(PingEcho control){
    setSpeed(0.3);
    turnLeft();
    PingEcho check = widePing();
    if(check.distance > control.distance){
      turnLeft();
      this.triedLeft = true;
    }
  }
  
}
