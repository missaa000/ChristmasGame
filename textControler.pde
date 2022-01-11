//text処理
//表示メッセージはsnpwMan classに

public class textControler{
  
  int blockNum = block.getBlockNum();
  int total;
  
  void YaleText(){
  //ブロックが一定消えた時のメッセージ
    //アイテムが1マスだけ見えた時のメッセージ
    total = block.getTotal();
    if(present1.cnt + scarf.cnt + dish.cnt == 1 && textFlag) textType = 14;
    if(present1.cnt + scarf.cnt + dish.cnt == 2) textFlag = true;
    if(total == 50) textType = 23;
    if(total == 100) textType = 15;
    if(total == 120) textType = 16;
    if(total == 140) textType = 24;
    if(total == 160) textType = 17;
    if(total == blockNum-1 && textFlag) textType = 18;
  }
  
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
      if(block.blockNum == 168) snowman.textDisp("nomal", 25);
      else snowman.textDisp("nomal", 26);
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
  
  //下にあるものによってテキストを変える
    int changeText(int name){    
    //下は床
    if(caketurn.top == 4){
      //落ちてくるのがケーキなら
      if(name != 0) return 19;
    }
    
    //下はcake1
    else if(caketurn.top == 1){
      return 21;
    }
    
    //下はcake2
    else if(caketurn.top == 2){
      //ケーキ３なら
      if(name == 3) return 20;
      //皿なら
      else if(name == 0) return 22;
    }
    
    //下はcake3
    else if(caketurn.top == 3){
      //皿なら
      if(name == 0) return 22;
    }
    
    return 0;
  }
}