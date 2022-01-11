import ddf.minim.*;

//ゲームの状態管理
int     gameStatus;
PImage  back;
PImage  object;
//雪だるまのテキスト関連
PFont   font;
int     textRand;
//テキストの表示時間カウント
int     timer;
//テキストを表示させるフラグ
boolean textFlag;
//テキストの種類
int     textType;
//ライトのタイム
int     time;
//音楽関連
Minim minim = new Minim(this);;
AudioPlayer song;
AudioPlayer SE;

//速くなるタイミング
public static final int time1 =  20;
public static final int time2 =  50;
public static final int time3 = 80;
public static final int time4 = 120;

//objects
Ball     ball     = new Ball();
Block    block    = new Block();
Items    cake1    = new Cakes(395,  30,  560,  1, 11, 1, 38);
Items    cake2    = new Cakes(377, 100,  590,  6, 10, 2, 55);
Items    cake3    = new Cakes(360, 250,  630,  9,  9, 3, 73); 
Items    dish     = new Cakes(340, 400,  680,  6, 14, 0, 37);
Items    present1 = new Items( 10, 350,  610, 10,  6);
Items    present2 = new Items(120, 250,  590, 12,  7);
Items    present3 = new Items( 40,  30,  450, 20,  8);
Items    scarf    = new Items(245, 350,  595,  6, 12);
Player   player   = new Player();
cakeTurn caketurn = new cakeTurn();
keyState Key      = new keyState();
snowMan  snowman  = new snowMan();

//systems
gameTitle    title  = new gameTitle();
gameTutorial tutori = new gameTutorial();
gameOver   gameover = new gameOver();
gameClear gameclear = new gameClear();
gamePlay   maingame = new gamePlay();
gameStatus  status  = new gameStatus();
textControler t_c   = new textControler();
animationControler a_c = new animationControler();

void setup(){
  size(600, 800);
  frameRate(60);
  setUp init = new setUp();
  init.init_setup();
}

void draw(){  
  if(!song.isPlaying()) song.play(0);
  
  image(back, 0, 0);
  //itemDispはitem表示をまとめた関数です
  a_c.itemDisplay();
  t_c.textDisplay();
  player.move();
  status.checkGameStatus();
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}

void keyPressed(){
  Key.updateState(keyCode, true);
}

void keyReleased(){
  Key.updateState(keyCode, false);
  Key.updateReleased();
}