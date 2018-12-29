public class Boxes{
  private int[] pos = new int[2];
  private boolean state;
  
  public Boxes(int posX, int posY, boolean state){
    pos[0] = posX;
    pos[1] = posY;
    this.state = state;
  }
  
  
  //Get statistics
  public int getBoxPosX(){
    return pos[0];
  }
  public int getBoxPosY(){
    return pos[1];
  }
  public boolean getState(){
    return state;
  }
  
  
  
  
  //Change position
  public void newBoxPos(String axis,int trans){
    if (axis.equals("x")){
       pos[0]+=trans;
    }
    if (axis.equals("y")){
      pos[1]+=trans;
    }
  }
  
}
