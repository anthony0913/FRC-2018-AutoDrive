void setup(){
  size(1060,534);
  background(169,169,169);
}

final int OUTER_SWITCH_W=92,OUTER_SWITCH_H=68;
final int INNER_SWITCH_W=84,INNER_SWITCH_H=60;

final int SCALE_WIDTH=80,SCALE_HEIGHT=60;

final int BOX_SIZE=20;
int[] boxPosX = new int[24];
int[] boxPosY = new int[24];

void draw(){
  //Platforms  
  fill(256,0,0);
  rect(426,156,104,222);
  fill(0,0,256);
  rect(530,156,104,222);
  
  //The following 4 objects all represent immovable obstacles
  
  //Switch Border
  fill(200,200,200);
  rect(228,144,OUTER_SWITCH_W,OUTER_SWITCH_H);
  rect(228,322,OUTER_SWITCH_W,OUTER_SWITCH_H);
  rect(740,144,OUTER_SWITCH_W,OUTER_SWITCH_H);
  rect(740,322,OUTER_SWITCH_W,OUTER_SWITCH_H);
  
  //Switch Interior
  fill(50,50,50);
  rect(232,148,INNER_SWITCH_W,INNER_SWITCH_H);
  rect(232,326,INNER_SWITCH_W,INNER_SWITCH_H);
  rect(744,148,INNER_SWITCH_W,INNER_SWITCH_H);
  rect(744,326,INNER_SWITCH_W,INNER_SWITCH_H);

  //Switch/Scale Bridge
  fill(220,220,220);
  rect(228,212,92,110);
  rect(740,212,92,110);
  rect(514,180,32,174);
  
  //Scale
  fill(50,50,50);
  rect(490,120,SCALE_WIDTH,SCALE_HEIGHT);
  rect(490,354,SCALE_WIDTH,SCALE_HEIGHT);
  
  //Boxes
  boxPosY[0] = 257;boxPosY[1] = 247;boxPosY[2] = 267;
  boxPosY[3] = 237;boxPosY[4] = 257;boxPosY[5] = 277; 
  boxPosY[6] = (int)(144+45.2*(0));boxPosY[7] = (int)(144+45.2*(1));
  boxPosY[8] = (int)(144+45.2*(2));boxPosY[9] = (int)(144+45.2*(3));
  boxPosY[10] = (int)(144+45.2*(4));boxPosY[11] = (int)(144+45.2*(5));
  boxPosY[12] = boxPosY[6];boxPosY[13] = boxPosY[7];boxPosY[14] = boxPosY[8];
  boxPosY[15] = boxPosY[9];boxPosY[16] = boxPosY[10];boxPosY[17] = boxPosY[11];
  boxPosY[18] = boxPosY[3];boxPosY[19] = boxPosY[4];boxPosY[20] = boxPosY[5];
  boxPosY[21] = boxPosY[1];boxPosY[22] = boxPosY[2];boxPosY[23] = boxPosY[0];

  boxPosX[0] = 168;boxPosX[1] = 188;boxPosX[2] = 188;
  boxPosX[3] = 208;boxPosX[4] = 208;boxPosX[5] = 208;
  boxPosX[6] = 320;boxPosX[7] = 320;boxPosX[8] = 320;
  boxPosX[9] = 320;boxPosX[10] = 320;boxPosX[11] = 320;
  boxPosX[12] = 1040-boxPosX[6];boxPosX[13] = 1040-boxPosX[7];
  boxPosX[14] = 1040-boxPosX[8];boxPosX[15] = 1040-boxPosX[9];
  boxPosX[16] = 1040-boxPosX[10];boxPosX[17] = 1040-boxPosX[11];
  boxPosX[18] = 1040-boxPosX[3];boxPosX[19] = 1040-boxPosX[4];
  boxPosX[20] = 1040-boxPosX[5];boxPosX[21] = 1040-boxPosX[1];
  boxPosX[22] = 1040-boxPosX[2];boxPosX[23] = 1040-boxPosX[0];
  
  
  fill(256,256,0);
  for(int i=0;i<24;i++){
    rect(boxPosX[i],boxPosY[i],BOX_SIZE,BOX_SIZE);
  }
  noFill();
  
  
  //Bots
  Bot redA = new Bot(0,0,50,"red");
  Bot redB = new Bot(0,178,50,"red");
  Bot redC = new Bot(0,356,50,"red");
  redA.show();
  redB.show();
  redC.show();
  
  Bot blueA = new Bot(1000,0,50,"blue");
  Bot blueB = new Bot(1000,178,50,"blue");
  Bot blueC = new Bot(1000,356,50,"blue");
  blueA.show();
  blueB.show();
  blueC.show();
  
  Field field = new Field(300);
  
  
  
  
  
  
  
  
}
