//落ちてくるアイテムのあれこれ
public class Items{
  protected int     x;
  protected int     y;
  protected int     bottom;
  protected int     speed  = 2;
  //特定のブロックを崩したかのカウント
  protected int     cnt    = 0;
  //消すべきブロックの値
  protected int     nolma;
  //雪だるまのテキストの種類
  protected int     text;
  protected PImage  image;
  //アイテムが着地したフラグ
  protected boolean bottomFlag = false;
 
  Items(int x, int y, int bottom, int nolma, int text){
    this.x        = x;
    this.y        = y;
    this.bottom   = bottom;
    this.nolma    = nolma;
    this.text = text;
  }
  
  //落ちるアニメーション
  void display(){
    if(cnt == nolma){
      y += speed;
      snowman.textDisp("nomal", this.text);
      
      if(y >= bottom){
        y = bottom;
        //雪だるまのテキストが無限表示されてしまうのを防ぐため
        cnt++;
        bottomFlag = true;
      }
      print(nolma);
    }
      
    image(image, x, y);
  
  }
  
  //アイテムを隠していたブロックが消えたらカウント
  void addCnt(){
    cnt++;
  }
  
}