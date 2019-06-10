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
Minim minim;
AudioPlayer song;

//速くなるタイミング
public static final int time1 =  30;
public static final int time2 =  80;
public static final int time3 = 230;
//public static int time4 = 200;

Ball     ball     = new Ball();
Block    block    = new Block();
Items    cake1    = new Cakes(395,  30,  560,  2, 11, 1, 38);
Items    cake2    = new Cakes(377, 100,  590,  6, 10, 2, 55);
Items    cake3    = new Cakes(360, 250,  630, 12,  9, 3, 73); 
Items    dish     = new Cakes(340, 400,  680,  9, 13, 0, 37);
Items    present1 = new Items( 10, 350,  610, 12,  6);
Items    present2 = new Items(120, 250,  590, 18,  7);
Items    present3 = new Items( 40,  30,  450, 37,  8);
Items    scarf    = new Items(245, 350,  595,  9, 12);
Player   player   = new Player();
cakeTurn caketurn = new cakeTurn();
keyState Key      = new keyState();
snowMan  snowman  = new snowMan();

void setup(){
  size(600, 800);
  frameRate(60);
  
  back   = loadImage("image/back.png");
  object = loadImage("image/object.png");
  
  cake1.image    = object.get(458,  99,  45,  38);
  cake2.image    = object.get(444, 229,  80,  55);
  cake3.image    = object.get(426, 368, 118,  73);
  dish.image     = object.get(406, 584, 157,  37);
  present1.image = object.get( 50,  55, 100, 110);
  present2.image = object.get( 35, 235, 120, 140);
  present3.image = object.get( 35, 435, 120, 270);
  scarf.image    = object.get(245, 410, 100,  90);
  snowman.face   = object.get(271, 569,  30,  30);
  
  Key.init();
  block.init();
  
  //日本語テキスト読み込み
  font     = createFont("MSP GOTHIC", 40, true);
  //ゲームオーバー時のランダムなテキスト表示
  textRand = 0;
  //文字表示のタイマー
  timer    = 0;
  time     = 0;
  //0:無言　その他喋る
  textType = 0;
  textFlag = true;
  textFont(font);  
  //音楽ロード
  minim    = new Minim(this);
  song     = minim.loadFile("music/ChristmasDay.mp3");
  
  //初めはタイトル画面
  gameStatus = 0;
}

void draw(){
  //if(!song.isPlaying())song.play(0);
  
  image(back, 0, 0);
  //itemDispはitem表示をまとめた関数です
  itemDisplay();
  textDisplay();
  player.move();
  
  //タイトル表示
  if(gameStatus      == 0){
    gameTitle();
  }
  
  //チュートリアル
  else if(gameStatus == 1){
    gameTutori();
  }
  
  //ゲームプレイ中
  else if(gameStatus == 2){
    gamePlay();
  }
  
  //ゲームクリア
  else if(gameStatus == 3){
    gameClear();
    
  }
  
  //ゲームオーバー
  else if(gameStatus == 4){
    gameOver();
  }
}


void gameTitle(){
  block.display();
  //タイトル文字
  fill(100, 100, 255);
  rect(120, 120, 360, 80);
  
  fill(255);
  textSize(30);
  text("いい感じのタイトル", 160, 170);
  
  //操作説明
  fill(0);
  textSize(20);
  text("Enter:会話を進める\n矢印キー:バーを動かす", 10, 550);
  
  //press enter key 点滅表示
  if(timer < 32){
    fill(250, 250, 100);
    rect(220, 355, 170, 30);
    fill(0);
    textSize(20);
    text("press enter key", 230, 375);
    timer = timer+1;
  }
  
  else if(32 <= timer && timer < 64){
    timer = timer+1;
  }
  
  else timer = 0;
  
  if(keyPressed == true){
      if(key == ENTER){
        if(Key.enterFlag){
          timer = 0;
          gameStatus = 1;
          Key.updatePressed();
        }
      }
   }
}

void gameTutori(){
  block.display();
  snowman.textDisp("nomal", 1);
  //gameStatus = 2;
}

void gamePlay(){ 
  //スピードアップ
  if(block.total == time1 || block.total == time2 ||
     block.total == time3){
    //ボールが速くなる一瞬だけを判定
    if(ball.speedFlag){
      ball.speedUp(block.total);
    }
  }  
  
  ball.move();
  block.display();

  fill(255);
  textSize(15);
  text(block.total, 550, 750);
  
  //ゲームクリア
  if(block.total == block.blockNum){
    gameStatus = 3;
  }
}

void gameClear(){
  textType = 25;
  right();
    
}

void gameOver(){
  if(block.total == block.blockNum){
    gameStatus = 3;
  }

  ball.init();
  block.display();
  
  //ゲームオーバー表示
  fill(100, 100, 255);
  rect(120, 120, 360, 80);
  
  fill(255);
  textSize(30);
  text("GAME OVER", 200, 170);
  
}

//テキストの扱い
void textDisplay(){
  //ゲームプレイ中のテキスト
  if(gameStatus == 2){
    //0:　何もしない
    if(textType == 0);
    
    //スピードアップ1
    else if(2 <= textType && textType <= 5){
      snowman.textDisp("nomal", textType); 
      timer++;
      
      if(timer > 240){
        //スピードアップフラグを再びtrueに
        ball.flagChange();
        textType = 0;
        timer = 0;
      }
    }

    //アイテムが1マス見えた時とあと１マスのコメント
    else if(textType == 14 || textType == 18){
      snowman.textDisp("nomal", textType); 
      timer++;
      
      if(timer > 240){
        timer = 0;
        textFlag = false;
        textType = 0;
      }
    }
    
    else {
      snowman.textDisp("nomal", textType);
      timer++;
      
      if(timer > 240){
        timer = 0;
        textType = 0;
      }
    }
  }
  
  //ゲームクリア
  else if(gameStatus == 3){
    snowman.textDisp("nomal", 25);
  }
  
  //ゲームオーバー
  else if(gameStatus == 4){
    if(block.total == 0){
      ball.vInit();
      if(player.dropCnt == 1)      snowman.textDisp("unique", 1);  
      else if(player.dropCnt == 2) snowman.textDisp("unique", 2);
      else if(player.dropCnt >= 3) snowman.textDisp("unique", 3);
    }
    
    else if(block.maxCnt >= 10 && block.blockFlag){
      snowman.textDisp("unique", 10);
    }
    
    else if(ball.wallHit > 30 && ball.ballFlag){
      snowman.textDisp("unique", 11);
    }
  
    //適当なメッセージ
    else snowman.textDisp("unique", textRand);
    
  }
}

void itemDisplay(){
  //0->1->2->3の順で上書き表示される
  //これ以外どう書けばいいか思いつかなかった
  if(caketurn.fallTurn.get(0) == 0) dish.display();
  if(caketurn.fallTurn.get(0) == 3) cake3.display();
  if(caketurn.fallTurn.get(0) == 2) cake2.display();
  if(caketurn.fallTurn.get(0) == 1) cake1.display();
  if(caketurn.fallTurn.get(1) == 0) dish.display();
  if(caketurn.fallTurn.get(1) == 3) cake3.display();
  if(caketurn.fallTurn.get(1) == 2) cake2.display();
  if(caketurn.fallTurn.get(1) == 1) cake1.display();
  if(caketurn.fallTurn.get(2) == 0) dish.display();
  if(caketurn.fallTurn.get(2) == 3) cake3.display();
  if(caketurn.fallTurn.get(2) == 2) cake2.display();
  if(caketurn.fallTurn.get(2) == 1) cake1.display();
  if(caketurn.fallTurn.get(3) == 0) dish.display();
  if(caketurn.fallTurn.get(3) == 3) cake3.display();
  if(caketurn.fallTurn.get(3) == 2) cake2.display();
  if(caketurn.fallTurn.get(3) == 1) cake1.display();
  
  present3.display();
  present2.display();
  present1.display();  
  scarf.display();
}

//JIGOKU
void right(){
  time++;
  
  noStroke();
  if(time <= 40)       fill(255, 100, 100, 200);
  else if(time <= 80)  fill(  0, 250, 255, 200);
  else if(time <= 120) fill(255,   0, 255, 200);
  else if(time <= 160) fill(100, 255,   0, 200);
  else if(time <= 200) fill(255, 255, 255, 200);
  else                 time = 0;
  ellipse( 50, 200, 20, 20);
  ellipse(100, 400, 20, 20);
  ellipse(150, 260, 20, 20);
  ellipse(250, 330, 20, 20);
  
  if(time <= 40)       fill(  0, 250, 255, 200);
  else if(time <= 80)  fill(255,   0, 255, 200);
  else if(time <= 120) fill(100, 255,   0, 200);
  else if(time <= 160) fill(255, 255, 255, 200);
  else if(time <= 200) fill(255, 100, 100, 200);
  else                 time = 0;  
  ellipse(300, 230, 20, 20);
  ellipse(350, 300, 20, 20);
  ellipse(400, 380, 20, 20);
  ellipse(450, 200, 20, 20);
  ellipse(125, 100, 20, 20);
  
  if(time <= 40)       fill(255,   0, 255, 200);
  else if(time <= 80)  fill(100, 255,   0, 200);
  else if(time <= 120) fill(255, 255, 255, 200);
  else if(time <= 160) fill(255, 100, 100, 200);
  else if(time <= 200) fill(  0, 250, 255, 200);
  else                 time = 0;
  ellipse( 25, 250, 20, 20);
  ellipse( 75,  30, 20, 20);
  ellipse(500, 330, 20, 20);
  
  if(time <= 40)       fill(100, 255,   0, 200);
  else if(time <= 80)  fill(255, 255, 255, 200);
  else if(time <= 120) fill(255, 100, 100, 200);
  else if(time <= 160) fill(  0, 250, 255, 200);
  else if(time <= 200) fill(255,   0, 255, 200);
  else                 time = 0;
  ellipse(175, 160, 20, 20);
  ellipse(225, 230, 20, 20);
  ellipse(375,  30, 20, 20);
  ellipse(325, 120, 20, 20);
  
  if(time <= 40)       fill(255, 255, 255, 200);
  else if(time <= 80)  fill(255, 100, 100, 200);
  else if(time <= 120) fill(  0, 250, 255, 200);
  else if(time <= 160) fill(255,   0, 255, 200);
  else if(time <= 200) fill(100, 255,   0, 200);
  else                 time = 0;
  ellipse(375, 180, 20, 20);
  ellipse(425,  50, 20, 20);
  ellipse(475, 230, 20, 20);
  ellipse(525, 130, 20, 20);

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