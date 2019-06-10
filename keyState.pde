//参考:https://qiita.com/leqfre/items/fd67704045fe9a02dd1f
//キー同時押しによるバグを防ぐ

public class keyState{
  private HashMap<Integer, Boolean> keyCodeManage;
  private boolean enterFlag;
  
  void init(){
    keyCodeManage = new HashMap<Integer, Boolean>();
    keyCodeManage.put(RIGHT ,false);
    keyCodeManage.put(LEFT  ,false);
    enterFlag     = true;
  }
  
  void updateState(int direction, boolean state){
    keyCodeManage.put(direction, state); 
  }
  
  boolean getState(int direction){
    return keyCodeManage.get(direction);
  }
  
  //押し続けても一度しか押されてない判定にする
  void updatePressed(){
    if(enterFlag) enterFlag = false;
  }
  
  void updateReleased(){
    if(!enterFlag) enterFlag = true;
  }
}