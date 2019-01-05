class Field{
  public Bot[] players;
  private int[] grid;
  private final int HEIGHT=534,WIDTH=1060;
  private Boxes[] boxes = new Boxes[24];
  private String[] scoreSides;
  
  private int[] scoreboard, powerups, queue, boxCount; //left is red, r is blue||
  private String[] states; //left switch, scale, right switch
  private int powerupTimer;
  public Field(int time, int players) {
    
    //Input Values
    this.players = new Bot[players];
    boxCount = new int[6]; //0red left, 1blue left, 2 red scale, 3 blue scale...
    scoreboard = new int[3];
    scoreboard[0]=0;
    scoreboard[1]=0;
    scoreboard[2] = time;//red score, blue score, time
    states = new String [3];
    powerups = new int[6]; //levels from 0 to 3, red force, boost, levitate, blue force, boost, levitate
    queue = new int[6];//1 for currently active powerup, assign sequential numbers afteward
    
    //Creating Players
    this.players[0] = new Bot(1,99,46,"red");
    this.players[1] = new Bot(1,244,46,"red");
    this.players[2] = new Bot(1,389,46,"red");
    this.players[3] = new Bot(1012+46   -   100,99+46,46,"blue");
    this.players[4] = new Bot(1012+46,244+46,46,"blue");
    this.players[5] = new Bot(1012+46,389+46,46,"blue");
    
    
    //
    
    
    //Create Grid
    /*
    0 = empty field
    1 = obstacles (switch bridge, scale bridge, switch walls, scale walls, arena walls)
    2 = l-switch r
    3 = l-switch b
    4 = scale r
    5 = scale b
    6 = r-switch r
    7 = r-switch b
    8 = box free
    9 =  box static x
    10 = box static y
    11 = box static
    12 = player
    13 = red platform
    14 = blue platform
    */
    //Field
    grid = new int[WIDTH*HEIGHT];
    for (int i=0;i<WIDTH*HEIGHT;i++){
      grid[i]=0;
    }
    
    
    
    //Platforms
    for (int i=156;i<=156+222;i++){//red platform
      for (int j=426;j<=426+104;j++){
        grid[i*WIDTH + j] = 10;}
    }
    for (int i=156;i<=156+222;i++){//blue platform
      for (int j=530;j<=530+104;j++){
        grid[i*WIDTH + j] = 11;}
    }//Change all of these to long rectangles that stretch horizontally and use integer collisions, draw values from grid
    
    
    //Borders
    for(int i=0;i<WIDTH;i++){//Horizontal borders
      grid[i] = 1;
      grid[(HEIGHT-1)*WIDTH + i] = 1;
    }
    for(int i=0;i<HEIGHT;i++){//Vertical Borders
      grid[WIDTH*i] = 1;
      grid[(WIDTH-1)+WIDTH*i] = 1;
    }
    
    
    //Left Switch
    for (int i=156;i<=156+222;i++){
      for (int j=530;j<=530+104;j++){
        grid[i*WIDTH + j] = 11;}
    }
    
    
    
    
    //Right Switch
    
    //Scale
    
    
    //Boxes (coordinate of top left corner)
    boxes[0] = new Boxes(168,257,false);
    boxes[1] = new Boxes(188,247,false);
    boxes[2] = new Boxes(188,267,false);
    boxes[3] = new Boxes(208,237,false);
    boxes[4] = new Boxes(208,257,false);
    boxes[5] = new Boxes(208,277,false);
    boxes[6] = new Boxes(320,(int)(144+45.2*(0)),false);
    boxes[7] = new Boxes(320,(int)(144+45.2*(1)),false);
    boxes[8] = new Boxes(320,(int)(144+45.2*(2)),false);
    boxes[9] = new Boxes(320,(int)(144+45.2*(3)),false);
    boxes[10] = new Boxes(320,(int)(144+45.2*(4)),false);
    boxes[11] = new Boxes(320,(int)(144+45.2*(5)),false);
    
    boxes[12] = new Boxes(720,(int)(144+45.2*(0)),false);
    boxes[13] = new Boxes(720,(int)(144+45.2*(1)),false);
    boxes[14] = new Boxes(720,(int)(144+45.2*(2)),false);
    boxes[15] = new Boxes(720,(int)(144+45.2*(3)),false);
    boxes[16] = new Boxes(720,(int)(144+45.2*(4)),false);
    boxes[17] = new Boxes(720,(int)(144+45.2*(5)),false);
    boxes[18] = new Boxes(832,277,false);
    boxes[19] = new Boxes(832,257,false);
    boxes[20] = new Boxes(832,237,false);
    boxes[21] = new Boxes(852,267,false);
    boxes[22] = new Boxes(852,247,false);
    boxes[23] = new Boxes(872,257,false);
  }
  
  
  
  
  //fetch statistics
  public int getTimer(){
    return scoreboard[2];
  }
  public Bot[] getPlayerData(){
    return players;
  }
  public int getPowerupTimer(){
    return powerupTimer;
  }
  
  
  
  //Utility
  public int convertCoordinates(Bot player){//converts Bot position of x and y into an index for grid
    int coordinates=0;
    for (int i=0;i<(int)player.getPosY();i++){
      coordinates+=WIDTH;
    }
    for (int i=0;i<(int)player.getPosX()-1;i++){
      coordinates+=1;
    }
    return coordinates;
  }
  
  
  
  public void checkCollision(){    
    for (int i=0;i<6;i++){
      //Front collisions
      int markerIndex = this.convertCoordinates(players[i]);
      int size = players[i].getSize();
      float direction = players[i].getDir();
      for(int j=1;j<=100;j++){
        if(grid[(int)(markerIndex - sin(direction-radians(26.565)) * size + cos(direction - radians(26.565))) + j] != 0) players[i].changeMobility(0,false);
        else {players[i].changeMobility(0,true);}      
      }
    }
  }
  
  
  
  //Display
  public void show(){
    for(int i=0;i<6;i++){
      players[i].show();
    }
  }
  
  
  
  
  
  //Powerup Calculations
  //Shifts the queue (to be used after the powerup timer reaches 0)
  public void rotateQueue() { //shifts the queue
    for (int i = 0;i<queue.length;i++) {
      if (queue[i]!=0) queue[i]-=1;}
  }
  //Determines the index to assign to powerups being queued 
  public int nextInQueue() { //assign this as the next queue number
    int max = 0;
    for (int i=0; i<queue.length;i++) {
      if (max<queue[i]) max = queue[i];}
    return max+1;
  }
  //Determines the index of the powerup currently active
  public int currentPowerup() {
    for (int i=0;i<queue.length;i++) {
      if (queue[i]==1) return i;}
    return -1;
  }
  
  
  
  
  
  //Score Calculators
  //Checks the ownership of each element at the end of each turn
  public void updateState() {
    //initial state checker
    if (boxCount[0]>boxCount[3]) states[0]="r";
    else if (boxCount[3]>=boxCount[0]) states[0]="n";
    
    if (boxCount[1]>boxCount[4]) states[1]="r";
    else if (boxCount[4]>boxCount[1]) states[1]="b";
    else if (boxCount[1]==boxCount[4]) states[1]="n";
    
    if (boxCount[2]>=boxCount[5]) states[2]="n";
    else if (boxCount[5]>boxCount[2]) states[2]="b";
    
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
