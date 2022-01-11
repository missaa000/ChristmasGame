//ケーキに落ちる順番を持たせたクラス
public class Cakes extends Items{
  //ケーキの高さ
  private int h;
  
  //bottom_topChangeを踏んだか
  private boolean fallFlag = true;

  //このケーキの名前
  //0:皿 1:ケーキ１ 2:ケーキ２ 3:ケーキ３
  int name;
  
  Cakes(int x, int y, int bottom, int nolma, int text, int name, int h){
    super(x, y, bottom, nolma, text);
    this.name = name;
    this.h = h;
  }

  //アイテム落下
  void display(){
    if(cnt == nolma){
      if(fallFlag){
        text = t_c.changeText(name);
        bottom = caketurn.bottom_topChange(name, this.h);
        fallFlag = false;
      }
      
      y += speed;
      snowman.textDisp("nomal", text);
      
      if(y >= bottom){
        y = bottom;
        //雪だるまのテキストが無限表示されてしまうのを防ぐため
        cnt++;
        bottomFlag = true;
      }
    }
      
    image(image, x, y);
  
  }
  
    
//アイテムを隠していたブロックが消えたらカウント
  void addCnt(){
    cnt++;
  }

}