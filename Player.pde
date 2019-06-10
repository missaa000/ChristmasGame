//プレイヤーがキー操作で動かすバー
public class Player {
  private float x =   250;
  private float y =   750;
  private float w =    90;
  private float h =     5;
  private float v =     5;
  private int dropCnt = 0;

  void move() {
    if(Key.getState(RIGHT)){
      x += v;
    } 
    else if(Key.getState(LEFT)){
      x -= v;
    }
    
    //壁に当たったら反転
    if(x < 0){
      x = 0;
    }
    else if(x > width-w){
      x = width - w;
    }

    fill(100, 200, 100);
    rect(x, y, w, h);
  }
  
  void overCnt(){
    dropCnt++;
  }
}