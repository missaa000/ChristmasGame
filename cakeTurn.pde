//ケーキが落ちてくる順番を管理するクラス
//このゲームでは需要あまりないけど配列の順番を変える方法を探すのが一番大変だった

import java.util.List;
//import java.util.ArrayList;

public class cakeTurn{
  //ケーキがいくつ落ちたか
  private int fallCake = 0;

  //現在のケーキの高さ
  private int totalh = 720;
  
  //一番上のオブジェクトは何か
  private int top = 4;

  //落ちた順番
  List<Integer> fallTurn = new ArrayList<Integer>(){
    {
      add(0);
      add(3);
      add(2);
      add(1);
    }  
  };
  
  //コピーする要素
  int tmpElement;
  
  //コピーする値
  int tmpV;
  
  int bottom_topChange(int name, int ith){
    if(top == 4){    //床
      totalh = totalh - ith;
    }
    
    else if(top == 1){  //ケーキ１がtop
      totalh = totalh + 11 - ith;
    }
    
    else if(top == 2){  //ケーキ２
      totalh = totalh + 8 - ith;
    }
    
    else if(top == 3){  //ケーキ３がtop
      totalh = totalh + 12 - ith;
    }
    
    else if(top == 0){  //皿
      totalh = totalh + 25 - ith;
    }
    
    //配列を落ちてきた順にソート
    //0123（2を配列0へ)->2013(3を配列1へ)->2301->2310みたいな
    if(fallCake != 3){
      tmpElement = fallTurn.indexOf(name);
      tmpV = fallTurn.get(tmpElement);
      fallTurn.remove(tmpElement);
      fallTurn.add(fallCake, tmpV);
    }
    
    //println(fallTurn.get(0), fallTurn.get(1), fallTurn.get(2), fallTurn.get(3));
    
    fallCake++;
    top = name;
    
    return totalh;
    
  }
}