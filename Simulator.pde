void setup(){
  size(1060,534);
  background(169,169,169);
  
}

final int OUTER_SWITCH_W=92,OUTER_SWITCH_H=68;
final int INNER_SWITCH_W=84,INNER_SWITCH_H=60;

final int SCALE_WIDTH=80,SCALE_HEIGHT=60;

final int BOX_SIZE=20;

boolean keyLeft = false, keyRight = false, movingForward = false;

void draw(){
  background(169,169,169);
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
  
  
  fill(256,256,0);
  for(int i=0;i<24;i++){
    rect(field.boxes[i].getBoxPosX(),field.boxes[i].getBoxPosY(),BOX_SIZE,BOX_SIZE);
  }
  noFill();
  
  
  if (keyLeft) field.players[0].turnLeft();
  if (keyRight) field.players[0].turnRight();
  if (movingForward) field.players[0].changeMoving(1);
  else field.players[0].changeMoving(0);
  
  field.show();  
  for(int i=0;i<6;i++){
    field.players[i].move();
  }
  //Collision Logic
  
  
}
void keyPressed(){
  if(keyCode == LEFT) keyLeft = true;
  if(keyCode == RIGHT) keyRight = true;
  if(keyCode == UP) movingForward = true;
  if(keyCode == DOWN) movingForward = false;
}
void keyReleased(){
  if(keyCode == LEFT) keyLeft = false;
  if(keyCode == RIGHT) keyRight = false;
}
