public class Bot{
  private int[] pos = new int[2];
  private final int size;
  private String team;
  private float direction; //Direction is represented in radians with 0 representing straight right
  private float speed;
  public Bot(int startX, int startY, int size, String team){
    pos[0] = startX;
    pos[1] = startY;
    this.size = size;
    this.team = team;
    if(team=="red") direction = 0;
    if(team=="blue") direction = PI;
    speed = 46.0/size;
  }
  public int getPosX(){
    return pos[0];
  }
  public int getPosY(){
    return pos[1];
  }
  public int getSize(){
    return size;
  }
  void show(){
    fill(0,120,120);
    rect(pos[0],pos[1],size,size);
    
    if (team=="red"){
      fill(256,0,0);
    }
    else{fill(0,0,256);}
    rect(pos[0],pos[1],5,5);
    
    //Arrow
    strokeWeight(3);
    line(pos[0]+size/2,pos[1]+size/2,(pos[0]+size/2) + cos(direction)*100,(pos[1]+size/2) + sin(direction)*100);
    strokeWeight(1);
    noFill();
  }
  public void move(){
    pos[0]+=10;
  }
  void robot(){    
  }
}
