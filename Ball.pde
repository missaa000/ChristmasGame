//雪玉の移動

public class Ball{
  private float x       = 300;
  private float y       = 500;
  private float w       =  20;
  private float h       =  20;
  private float vx      =   4;
  private float vy      =   4;
  //傾き
  private float rand    = 2.3;
  private int   wallHit = 0;
  //ball-ball.h = player.yの時のx座標
  //バーに一度触れたらfalse　ブロックに触れたらtrue
  private boolean barFlag   = false;
  private boolean ballFlag   = true;
  private boolean speedFlag = true;
  
  void init(){
    this.x    = 300;
    this.y    = 500;
    rand = 2.3;
    fill(255, 255, 255);
    ellipse(x, y, w, h);
  }
  
  void vInit(){
    if(vx < 0) vx = -vx;
    if(vy < 0) vy = -vy;
  }
  
  void move(){
    this.x += vx;
    this.y += vy/rand;
    
    //壁に当たったらx反転
    if(x+w/2 > width || x-w/2 < 0){
      vx      = -vx;
      wallHit++;
      //println(wallHit);
      barFlag = true;
    }
    //上に行き過ぎたら
    if(this.y - this.h < 0){
      vy      = -vy;
      wallHit++;
      //println(wallHit);
      barFlag = true;
    }
    
    //バーに当たったら傾きを変えてy反転
    //ボールがすり抜けるバグを防ぐため長さ+10で判定
    if(player.x - 10 <= this.x && this.x <= (player.x + player.w + 10) &&
      (this.y + this.h/2 - 2) <= player.y && player.y <= (this.y + this.h/2 + 1)){
      if(barFlag){
         rand    = random(1, 2);
         block.cntInit();
         vy      = -vy;
         barFlag = false;
      }
    }
    
    //ゲームオーバー
    if(this.y > height){
      player.overCnt();
      //println(player.dropCnt);
      //ランダムメッセージの決定
      textRand   = (int)random(4, 10);
      gameStatus = 4;
    }

    fill(255, 255, 255);
    ellipse(x, y, w, h);
    
  }
  
  //スピードアップ
  void speedUp(int total){
    //呼ばれる度インクリメントだとうまくスピードアップしなかったので
    //わざと分岐しています　でも初期の実装の時点の話です
    if(total == time1){
      vx       = 5;
      vy       = 5;
      textType = 2;
    }
    
    if(total == time2){
      vx       = 6;
      vy       = 6;
      textType = 3;
    }
    
    if(total == time3){
      vx       = 7;
      vy       = 7;
      textType = 4;
    }
    
    if(total == time4){
      vx       = 7;
      vy       = 7;
      textType = 5;
    }
    
    speedFlag  = false;
  }
  
  void flagChange(){
    speedFlag = true;
  }
  
  //ブロックとのヒット
  boolean hitcheck(int i, int j){
    if(block.xy[i][j]){
      //ブロックの上面に触れた時
      if(j*block.w < this.x && this.x < (j+1)*block.w && 
         i*block.h < (this.y+ball.h/3) && (this.y+2*this.h/3) < (i*block.h + block.h/2)){
          this.vy =-this.vy;
          block.barCnt();
          block.itemBlock(i, j);
          barFlag = true;
          wallHit = 0;
          if(!SE.isPlaying()) SE.play(0);
          //println(wallHit);
      }
      
      //ブロックの下面に触れた時
      else if(j*block.w < this.x && this.x < (j+1)*block.w &&
        (i*block.h + block.h/2) < (this.y-this.h/2) && (this.y-this.h/2) < ((i+1)*block.h)){
          this.vy =-this.vy;
          block.barCnt();
          block.itemBlock(i, j);
          barFlag = true;
          wallHit = 0;
          if(!SE.isPlaying()) SE.play(0);
          //println(wallHit);
      }
      
      //ブロックの左面に触れた時
      else if(i*block.h < this.y && this.y < (i+1)*block.h &&
        j*block.w < (this.x+this.w/2) && (this.x+this.w/2) < (j*block.x + block.w/4)){
          this.vx =-this.vx;
          block.barCnt();
          block.itemBlock(i, j);
          barFlag = true;
          wallHit = 0;
          if(!SE.isPlaying()) SE.play(0);
          //println(wallHit);
      }
      
      //ブロックの右面に触れた時
      else if(i*block.h < this.y && this.y < (i+1)*block.h &&
        (j*block.w + 2*block.w/3) < (this.x-this.w/2) && (this.x-this.w/2) < ((j+1)*block.w)){
          this.vx =-this.vx;
          block.barCnt();
          block.itemBlock(i, j);
          barFlag = true;
          wallHit = 0;
          if(!SE.isPlaying()) SE.play(0);
      
          //println(wallHit);
      }
      
      else return true;      
    }
    
    return false;
  }
  
  void changeFlag(){
    barFlag = false;
  }
  
  void changeBallFlag(){
    ballFlag   = false;
  }
}