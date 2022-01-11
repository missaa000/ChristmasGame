//ゲームオーバー画面

public class gameOver{
  
  void gameover(){
    if(block.total == block.blockNum){
      gameStatus = 3;
    }
  
    ball.init();
    block.display();
    
    //ゲームオーバー表示
    fill(100, 100, 255);
    rect(120, 120, 360, 80);
    
    fill(255);
    textSize(30);
    text("GAME OVER", 200, 170);

  }
}