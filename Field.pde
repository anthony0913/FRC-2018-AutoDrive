public class Field{
  private Bot[] players;
  private int[] grid;
  private int[] scoreboard, powerups, queue, boxes; //left is red, r is blue||
  private String[] states; //left switch, scale, right switch
  private int powerupTimer;
  public Field(int time, int players) {
    this.players = new Bot[players];
    boxes = new int[6]; //0red left, 1 blue left,2 red scale, 3 blue scale...
    scoreboard = new int[3];scoreboard[0]=0;scoreboard[1]=0;scoreboard[2] = time;//red score, blue score, time
    states = new String [3];
    powerups = new int[6]; //levels from 0 to 3, red force, boost, levitate, blue force, boost, levitate
    queue = new int[6];//1 for currently active powerup, assign sequential numbers afteward
  }
  
  public void initialize(){
    Bot redA = new Bot(0,0,50,"red");
    Bot redB = new Bot(0,178,50,"red");
    Bot redC = new Bot(0,356,50,"red");
    
    Bot blueA = new Bot(1010,0,50,"blue");
    Bot blueB = new Bot(1010,178,50,"blue");
    Bot blueC = new Bot(1010,356,50,"blue");
  }
  
  public int getTimer(){
    return scoreboard[2];
  }
  
  
  //Shifts the queue (to be used after the powerup timer reaches 0)
  public void rotateQueue() { //shifts the queue
    for (int i = 0;i<queue.length;i++) {
      if (queue[i]!=0) queue[i]-=1;
    }
  }
  
  public int getPowerupTimer(){
    return powerupTimer;
  }
  
  //Determines the index to assign to powerups being queued 
  public int nextInQueue() { //assign this as the next queue number
    int max = 0;
    for (int i=0; i<queue.length;i++) {
      if (max<queue[i]) max = queue[i];
    }
    return max+1; 
  }
  
  //Determines the index of the powerup currently active
  public int currentPowerup() {
    for (int i=0;i<queue.length;i++) {
      if (queue[i]==1) return i;
    }
    return -1;
  }
  
  //Checks the ownership of each element at the end of each turn
  public void updateState() {
    //initial state checker
    if (boxes[0]>boxes[3]) states[0]="r";
    else if (boxes[3]>=boxes[0]) states[0]="n";
    
    if (boxes[1]>boxes[4]) states[1]="r";
    else if (boxes[4]>boxes[1]) states[1]="b";
    else if (boxes[1]==boxes[4]) states[1]="n";
    
    if (boxes[2]>=boxes[5]) states[2]="n";
    else if (boxes[5]>boxes[2]) states[2]="b";
    
    //force checker
    if (currentPowerup()==0) { //checks force for red
      if (powerups[0]==1) states[0]="r";
      if (powerups[0]==2) states[1]="r";
      if (powerups[0]==3) {states[0]="r";states[1]="r";}
    }
    if (currentPowerup()==3) {//checks force for blue
      if (powerups[3]==1) states[0]="b";
      if (powerups[3]==2) states[1]="b";
      if (powerups[3]==3) {states[0]="b";states[1]="b";}
    }
  }
  
  
  //Calculates the score to distribute each turn
  public int[] calcScore() {
    int[] initSum = new int[4], sum = new int[2];
    //Adders
    if (states[0]=="r") initSum[0]=1;
    if (states[0]=="b") initSum[3]=1;
    
    if (states[1]=="r") initSum[1]=1;
    if (states[1]=="b") initSum[4]=1;
    //Multipliers
    if (currentPowerup()==1) {
      if (powerups[0]==1) initSum[0]*=2;
      if (powerups[0]==2) initSum[1]*=2;
      if (powerups[0]==3) initSum[0]*=2;initSum[1]*=2;
    }
    if (currentPowerup()==4) {
      if (powerups[3]==1) initSum[2]*=2;
      if (powerups[3]==2) initSum[3]*=2;
      if (powerups[3]==3) initSum[2]*=2;initSum[3]*=2;
    }
    sum[0] = initSum[0] + initSum[1];
    sum[1] = initSum[2] + initSum[3];
    return sum;
  }
}
