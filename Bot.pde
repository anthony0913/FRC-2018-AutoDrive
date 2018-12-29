class Bot{
  private float[] pos = new float[2];
  private final int size;
  private String team;
  private float direction; //Direction is represented in radians with 0 representing straight right
  private float speed;
  private int isMoving = 0;
  
  
  public Bot(int startX, int startY, int size, String team){
    pos[0] = startX;
    pos[1] = startY;
    this.size = size;
    this.team = team;
    if(team=="red") direction = 0;
    if(team=="blue") direction = 0.75*(-PI);
    speed = 3*(46.0/size);
  }
  
  
  //Fetch Statistics
  public float getPosX(){
    return pos[0];
  }
  public float getPosY(){
    return pos[1];
  }
  public int getSize(){
    return size;
  }
  
  
  
  
  
  //Display
  void show(){
    fill(0,120,120);
    rect(pos[0],pos[1],size,size);
    
    if (team=="red"){
      fill(256,0,0);
    }
    else{fill(0,0,256);}
    rect(pos[0],pos[1],5,5);
    
    //Arrow
    strokeWeight(2);
    line(pos[0]+size/2,pos[1]+size/2,(pos[0]+size/2) + cos(direction)*100,(pos[1]+size/2) + sin(direction)*100);
    strokeWeight(1);
    noFill();
  }
  
  
  
  
  //Utility
  public void move(){
    pos[0]+=cos(direction)* speed * isMoving;
    pos[1]+=sin(direction)* speed * isMoving;
  }
  public void changeMoving(int x){
    isMoving = x;
  }
  public void turnLeft(){
    direction-=0.05;
  }
  public void turnRight(){
    direction+=0.05;
  }
}
