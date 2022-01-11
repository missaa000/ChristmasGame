//消していくブロック
public class Block{
  private int   x     = 8;
  private int   y     = 23;
  private float h     = 20;
  private float w     = 75;
  private boolean xy[][] = new boolean[y][x];
  private boolean blockFlag = true;
  //消した総数
  private int total   =  0;
  //バーから離れて戻ってくるまでに消した総数
  //雪だるまのバグ指摘のため
  private int cnt     =  0;
  private int maxCnt  =  0;
  //ブロックの数
  private int blockNum = x*(y-2);
  
  void init(){
    for(int i = 0; i < y; i++){
      for(int j = 0; j < x; j++){       
        if(i == 0 || i == 1){
          xy[i][j] = false;

        }
        else xy[i][j] = true;
      }
    }
  }
  
  void display(){
    for(int i = 0; i < y; i++){
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
    if(total == 80) textType = 23;
    if(total == 100) textType = 15;
    if(total == 120) textType = 16;
    if(total == 140) textType = 24;
    if(total == 150) textType = 17;
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
    if((18 < i && i < 22) && (3 <= j && j <= 4)){
      scarf.addCnt();
      println("scarf = " + scarf.cnt);
    }
          
    //皿
    if((20 <= i && i <= 21) && (4 <= j && j <= 6)){
      dish.addCnt();
      println("dish = " + dish.cnt);
    }
          
    //ケーキ下段
    if((11 <= i && i <= 15) && (4 <= j && j <= 6)){
      cake3.addCnt();
      println("cake3 = " + cake3.cnt);
    }
          
    //ケーキ中段
    if((6 <= i && i <= 7) && (4 <= j && j <= 6)){
      cake2.addCnt();
      println("cake2 = " + cake2.cnt);
    }
    
    //ケーキ上段
    if((i == 2) && (j == 5)){
      cake1.addCnt();
      println("cake1 = " + cake1.cnt);
    }
          
    //白プレゼント
    if((y-5 <= i && i <= y) && (0 <= j && j <= 1)){
       present1.addCnt();
       println("pre1 = " + present1.cnt);
    }
          
    //緑プレゼント
     if((y-11 <= i && i <= y-5) && (1 <= j && j <= 2)){
       present2.addCnt();
       println("pre2 = " + present2.cnt);
     }
          
    //プレゼント兄弟
    if((2 <= i && i <= 11) && (0 <= j && j <= 1)){
       present3.addCnt();
       println("pre3 = " + present3.cnt);
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