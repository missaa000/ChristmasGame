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
  
  //下にあるものによってテキストを変える
    void changeText(){    
    //下は床
    if(caketurn.top == 4){
      //落ちてくるのがケーキなら
      if(name != 0) text = 19;
    }
    
    //下はcake1
    else if(caketurn.top == 1){
      text = 21;
    }
    
    //下はcake2
    else if(caketurn.top == 2){
      //ケーキ３なら
      if(name == 3) text = 20;
      //皿なら
      else if(name == 0) text = 22;
    }
    
    //下はcake3
    else if(caketurn.top == 3){
      //皿なら
      if(name == 0) text = 22;
    }
  }

  //落ちるアニメーション
  void display(){
    if(cnt == nolma){
      if(fallFlag){
        changeText();
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