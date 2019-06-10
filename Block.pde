//消していくブロック
public class Block{
  private int   x     = 15;
  private int   y     = 23;
  private float h     = 20;
  private float w     = 40;
  private boolean xy[][] = new boolean[y][x];
  private boolean blockFlag = true;
  //消した総数
  private int total   =  0;
  //バーから離れて戻ってくるまでに消した総数
  //雪だるまのバグ指摘のため
  private int cnt     =  0;
  private int maxCnt  =  0;
  //ブロックの数
  private int blockNum = 315;
  
  void init(){
    for(int i = 0; i < y; i++){
      for(int j = 0; j < x; j++){       
        //この条件分岐にするとケーキの順番をぐちゃぐちゃにしやすくなる
        //if(i == 0 || 8 > j) xy[i][j] = false;
        if(i == 0 || i == 1) xy[i][j] = false;
        else xy[i][j] = true;
      }
    }
  }
  
  void display(){
    for(int i = 1; i < y; i++){
      for(int j = 0; j < x; j++){  
        xy[i][j] = ball.hitcheck(i, j);
        //ボールが当たってなかったら
        if(xy[i][j]){               
          fill(255, 255, 255);         
          stroke(100, 150, 255);
          rect(w*j, h*i, w, h);
        }
      }
    }
    
    //ブロックが一定消えた時のメッセージ
    //アイテムが1マスだけ見えた時のメッセージ
    if(present1.cnt + scarf.cnt + dish.cnt == 1 && textFlag) textType = 14;
    if(present1.cnt + scarf.cnt + dish.cnt == 2) textFlag = true;
    if(total == 100) textType = 23;
    if(total == 180) textType = 15;
    if(total == 210) textType = 16;
    if(total == 250) textType = 24;
    if(total == 300) textType = 17;
    if(total == blockNum-1 && textFlag) textType = 18;
    
  }
 
  //バーに当たって帰ってくるまでに当たったブロックの数を記録
  void barCnt(){
    cnt++;
    total++;
    
    if(maxCnt < cnt) maxCnt = cnt;
  }
  
  void itemBlock(int i, int j){
    //マフラーがあるブロックが崩れたら
    if((17 < i && i < 21) && (5 < j && j < 9)){
      scarf.addCnt();
    }
          
    //皿
    else if((19 < i && i < 22) && (7 < j && j < 13)){
      dish.addCnt();
      //println("dish = " + dish.cnt);
    }
          
    //ケーキ下段
    else if((12 < i && i < 17) && (8 < j && j < 12)){
      cake3.addCnt();
      //println("cake3 = " + cake3.cnt);
    }
          
    //ケーキ中段
    else if((5 < i && i < 8) && (8 < j && j < 12)){
      cake2.addCnt();
      //println("cake2 = " + cake2.cnt);
    }
    
    //ケーキ上段
    else if((1 < i && i < 4) && (9 < j && j < 11)){
      cake1.addCnt();
      //println("cake1 = " + cake1.cnt);
    }
          
    //白プレゼント
    else if((18 < i && i < 23) && (0 <= j && j < 3)){
       present1.addCnt();
       //println("pre1 = " + present1.cnt);
    }
          
    //緑プレゼント
     else if((12 < i && i < 19) && (2 < j && j < 6)){
       present2.addCnt();
       //println("pre2 = " + present2.cnt);
     }
          
    //プレゼント兄弟
    else if((1 < i && i < 15) && (0 < j && j < 4)){
       present3.addCnt();
       //println("pre3 = " + present3.cnt);
    }
  }
  
  void cntInit(){
    cnt = 0;
  }
  
  void maxInit(){
    maxCnt = 0;
  }
  
  void changeFlag(){
    blockFlag = false;
  }
}