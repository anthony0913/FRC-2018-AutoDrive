public class Bot{
  private int[] pos = new int[2];
  private final int size;
  private String team;
  public Bot(int startX, int startY, int size, String team){
    pos[0] = startX;
    pos[1] = startY;
    this.size = size;
    this.team = team;
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
    noFill();
    if (team=="red"){
      fill(256,0,0);
    }
    else{fill(0,0,256);}
    rect(pos[0],pos[1],5,5);
  }
}
