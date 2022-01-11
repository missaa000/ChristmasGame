//ゲームの状態遷移フラグの管理

public class gameStatus{
  
  void checkGameStatus(){
    //タイトル表示
    if(gameStatus      == 0){
      title.title();
    }
    
    //チュートリアル
    else if(gameStatus == 1){
      tutori.tutori();
    }
    
    //ゲームプレイ中
    else if(gameStatus == 2){
      maingame.maingame();
    }
    
    //ゲームクリア
    else if(gameStatus == 3){
      gameclear.gameclear();
      
    }
    
    //ゲームオーバー
    else if(gameStatus == 4){
      gameover.gameover();
    }
  }
}