//雪だるまの口、アイテムの表示

public class animationControler {
  
  //口パクの時間
  private int    faceTimer = 0;
  private PImage face;
  
  void snowmanMouth(){
    //口パクの処理
    faceTimer++;
    if(faceTimer < 30) image(face, 271, 569);
    else if(60 <= faceTimer) faceTimer = 0; 
  }
  
  //アイテムの表示
  void itemDisplay(){
    //0->1->2->3の順で上書き表示される
    if(caketurn.fallTurn.get(0) == 0) dish.display();
    if(caketurn.fallTurn.get(0) == 3) cake3.display();
    if(caketurn.fallTurn.get(0) == 2) cake2.display();
    if(caketurn.fallTurn.get(0) == 1) cake1.display();
    if(caketurn.fallTurn.get(1) == 0) dish.display();
    if(caketurn.fallTurn.get(1) == 3) cake3.display();
    if(caketurn.fallTurn.get(1) == 2) cake2.display();
    if(caketurn.fallTurn.get(1) == 1) cake1.display();
    if(caketurn.fallTurn.get(2) == 0) dish.display();
    if(caketurn.fallTurn.get(2) == 3) cake3.display();
    if(caketurn.fallTurn.get(2) == 2) cake2.display();
    if(caketurn.fallTurn.get(2) == 1) cake1.display();
    if(caketurn.fallTurn.get(3) == 0) dish.display();
    if(caketurn.fallTurn.get(3) == 3) cake3.display();
    if(caketurn.fallTurn.get(3) == 2) cake2.display();
    if(caketurn.fallTurn.get(3) == 1) cake1.display();
    
    present3.display();
    present2.display();
    present1.display();  
    scarf.display();
  }
}