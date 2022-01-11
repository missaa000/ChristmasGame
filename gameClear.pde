//ゲームクリア画面

public class gameClear{
  
  void gameclear(){
    textType = 25;
    right();
  }
  
  //光る玉
  void right(){
    time++;
    
    noStroke();
    if(time <= 40)       fill(255, 100, 100, 200);
    else if(time <= 80)  fill(  0, 250, 255, 200);
    else if(time <= 120) fill(255,   0, 255, 200);
    else if(time <= 160) fill(100, 255,   0, 200);
    else if(time <= 200) fill(255, 255, 255, 200);
    else                 time = 0;
    ellipse( 50, 200, 20, 20);
    ellipse(100, 400, 20, 20);
    ellipse(150, 260, 20, 20);
    ellipse(250, 330, 20, 20);
    
    if(time <= 40)       fill(  0, 250, 255, 200);
    else if(time <= 80)  fill(255,   0, 255, 200);
    else if(time <= 120) fill(100, 255,   0, 200);
    else if(time <= 160) fill(255, 255, 255, 200);
    else if(time <= 200) fill(255, 100, 100, 200);
    else                 time = 0;  
    ellipse(300, 230, 20, 20);
    ellipse(350, 300, 20, 20);
    ellipse(400, 380, 20, 20);
    ellipse(450, 200, 20, 20);
    ellipse(125, 100, 20, 20);
    
    if(time <= 40)       fill(255,   0, 255, 200);
    else if(time <= 80)  fill(100, 255,   0, 200);
    else if(time <= 120) fill(255, 255, 255, 200);
    else if(time <= 160) fill(255, 100, 100, 200);
    else if(time <= 200) fill(  0, 250, 255, 200);
    else                 time = 0;
    ellipse( 25, 250, 20, 20);
    ellipse( 75,  30, 20, 20);
    ellipse(500, 330, 20, 20);
    
    if(time <= 40)       fill(100, 255,   0, 200);
    else if(time <= 80)  fill(255, 255, 255, 200);
    else if(time <= 120) fill(255, 100, 100, 200);
    else if(time <= 160) fill(  0, 250, 255, 200);
    else if(time <= 200) fill(255,   0, 255, 200);
    else                 time = 0;
    ellipse(175, 160, 20, 20);
    ellipse(225, 230, 20, 20);
    ellipse(375,  30, 20, 20);
    ellipse(325, 120, 20, 20);
    
    if(time <= 40)       fill(255, 255, 255, 200);
    else if(time <= 80)  fill(255, 100, 100, 200);
    else if(time <= 120) fill(  0, 250, 255, 200);
    else if(time <= 160) fill(255,   0, 255, 200);
    else if(time <= 200) fill(100, 255,   0, 200);
    else                 time = 0;
    ellipse(375, 180, 20, 20);
    ellipse(425,  50, 20, 20);
    ellipse(475, 230, 20, 20);
    ellipse(525, 130, 20, 20);
  
  }
}