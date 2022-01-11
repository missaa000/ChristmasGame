//ブロック崩し中の画面

public class gamePlay{
  
  void maingame(){ 
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
}