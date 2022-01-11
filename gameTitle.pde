//タイトル画面

public class gameTitle{
  
  void title(){
    block.display();
    //タイトル文字
    fill(100, 100, 255);
    rect(150, 120, 300, 120);
    
    fill(255);
    textSize(30);
    text("クリスマスの\nブロック崩し", 190, 170);
    
    //クレジット
    fill(0);
    textSize(10);
    text("music:MMT STUDIO(https://mmt38.info/kiyaku/)\n魔王魂(https://maou.audio/category/se/se-system/)", 10, 750);
    
    //press enter key 点滅表示
    if(timer < 32){
      fill(250, 250, 100);
      rect(220, 355, 170, 30);
      fill(0);
      textSize(20);
      text("press enter key", 230, 375);
      timer = timer+1;
    }
    
    else if(32 <= timer && timer < 64){
      timer = timer+1;
    }
    
    else timer = 0;
    
    if(keyPressed == true){
        if(key == ENTER){
          if(Key.enterFlag){
            timer = 0;
            gameStatus = 1;
            Key.updatePressed();
          }
        }
     }
  }
}