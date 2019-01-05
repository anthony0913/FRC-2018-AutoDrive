class Bot{
  private float[] pos = new float[2];
  private final int size;
  private String team;
  private float direction; //Direction is represented in radians with 0 representing straight right
  private float speed;
  private int isMoving = 0;
  private boolean[] canMove = new boolean[4];//forward, right, back, left
  
  
  public Bot(int startX, int startY, int size, String team){
    for(int i=0;i<canMove.length;i++) canMove[i] = true;
    pos[0] = startX;
    pos[1] = startY;
    this.size = size;
    this.team = team;
    if(team=="red") direction = 0;
    if(team=="blue") direction = PI;    //-3.141596535)/2.0;
    speed = 3*(46.0/size);
    
    for(int i=0;i<4;i++) canMove[i] = true;
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
  public float getDir(){
    return direction;
  }
  
  
  
  //Collision Detection
  public void changeMobility(int index, boolean state){
    canMove[index] = state;
  }
  
  
  
  
  //Display
  void show(){
    
    pushMatrix();
    translate(pos[0],pos[1]); //Robots use their back left wheel as a pivot point
    rotate((-1)*direction);
    fill(0,120,120);
    rect(0,0,size,size);
    
    
    //Team Marker
    if (team=="red"){
      fill(255,0,0);
    }
    if (team=="blue"){
      fill(0,0,255);
    }
    rect(0,0,5,5);
    
    
    //Direction Arrow
    strokeWeight(2);
    line(size/2,size/2,(size/2) + 100,(size/2));
    strokeWeight(1);
    noFill();
    
    
    popMatrix();
  }
  
  
  
  
  //Movement
  public void move(){
    if (canMove[0] && isMoving>0) pos[0]+=cos(-direction)* speed * isMoving;
    else if (canMove[3] && isMoving<0) pos[0]+=cos(-direction)* speed * isMoving;
    if (canMove[0] && isMoving>0)pos[1]+=sin(-direction)* speed * isMoving;
    else if (canMove[0] && isMoving<0)pos[1]+=sin(-direction)* speed * isMoving;
  }
  public void changeMoving(int x){
    isMoving = x;
  }
  public void turnLeft(){
    direction+=0.05;
    
  }
  public void turnRight(){
    direction-=0.05;
  }
}
