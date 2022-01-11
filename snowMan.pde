//雪だるまのテキスト
//タイトルとゲームオーバーで喋る

public class snowMan{
  private String text;
  private int    textNum = 0;
  
  
  void textDisp(String type, int scene){    
    fill(255);
    rect(390, 490, 150, 80, 5);
    
    a_c.snowmanMouth();
    
    if(type == "nomal"){
      this.text = snowman.nomalText(scene, textNum);
    }
    
    else if(type == "unique"){
      this.text = snowman.uniqueText(scene, textNum);
    }
     
    //エンドだった場合終了
    if(this.text == "end"){
      textNum = 0;
      block.cntInit();
      block.maxInit();
      gameStatus = 2;
      return;
    }
      
    fill(0);
    textSize(13);
    text(this.text, 400, 500, 140, 70);
    
    
    if(keyPressed == true){
      if(key == ENTER){
        if(Key.enterFlag){
          textNum++;
          Key.updatePressed();
        }
      }
    }
  }

  //通常のセリフ
  String nomalText(int scene, int textNum){
    if(scene == 1){
      if(textNum ==  0) text = "ハロー！　　　　　　メリークリスマス！";
      if(textNum ==  1) text = "え？　まだ早い？";
      if(textNum ==  2) text = "まあ細かいことは　　気にしない！";
      if(textNum ==  3) text = "そんなことより上の　雪をどうにかしてくれないかな";
      if(textNum ==  4) text = "せっかくクリスマスの飾り付けをしたのに";
      if(textNum ==  5) text = "雪で埋もれ　　　　　ちゃったんだよ";
      if(textNum ==  6) text = "雪玉でもぶつけて　　崩して！";
      if(textNum ==  7) text = "矢印キーでバーを　　動かしてプレゼントを発掘してね";
      if(textNum ==  8) text = "え？　なんで宙に雪が浮いてるかって？";
      if(textNum ==  10) text = "まあいいじゃないか　細かいことは";
      if(textNum == 11){
        text = "じゃあはじめるよ〜";
        ball.init();
      }
      if(textNum == 12){
        text = "end"; 
        ball.init();
      }
    }
    
    if(scene == 2){
      if(textNum == 0) text = "スピードアップ！";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 3){
      if(textNum == 0) text = "大丈夫？　　　　　　まだまだ速くなるよ〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 4){
      if(textNum == 0) text = "ついてきて〜　　　　もっと速くなるよ〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 5){
      if(textNum == 0) text = "やるね〜　　　　　　これでもついてこられるかな？";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 6){
      if(textNum == 0) text = "クリスマスに　　　　プレゼントは欠かせ　ないね〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 7){
      if(textNum == 0) text = "クリスマスカラーで　いいね〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 8){
      if(textNum == 0) text = "プレゼントの兄弟だ〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 9){
      if(textNum == 0) text = "わあ　　　　　　　　なんかすごい色だね";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 10){
      if(textNum == 0) text = "すごい紫な　　　　　ケーキだね？";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 11){
      if(textNum == 0) text = "かわいいいちごの　　ケーキだね";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 12){
      if(textNum == 0) text = "くれるの？　　　　　ありがとう〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 13){
      if(textNum == 0) text = "なにこれ";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 14){
      if(textNum == 0) text = "あ　　　　　　　　　埋もれたアイテムが";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 15){
      if(textNum == 0) text = "少し進んできたね";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 16){
      if(textNum == 0) text = "だいぶ見晴らしが　　よくなったね〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 16){
      if(textNum == 0) text = "だんだん終わりが　　見えてきたね〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 17){
      if(textNum == 0) text = "あと少し！　　　　　がんばれ〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 18){
      if(textNum == 0) text = "あと一個〜！";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 19){
      if(textNum == 0) text = "えっ　　　　　　　　床に置くの？";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 20){
      if(textNum == 0) text = "わあ　　　　　　　　バランス最悪だね〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 21){
      if(textNum == 0) text = "あああああ　　　　　いちごがあああああ";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 22){
      if(textNum == 0) text = "いまさら　　　　　　お皿きたの？";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 23){
      if(textNum == 0) text = "明日はいい天気かな〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 24){
      if(textNum == 0) text = "その調子〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 25){
      if(textNum == 0) text = "おお〜　　　　　　　すっかり元どおり";
      if(textNum == 1) text = "これでこのゲームは　終わり";
      if(textNum == 2) text = "飾り付け直して　　　くれてありがとう";
      if(textNum == 3) text = "じゃあね！";
      if(textNum == 4){
        stop();
        exit();
      }
    }
    if(scene == 26){
      if(textNum == 0) text = "おお〜　　　　　　　すっかり元どおり";
      if(textNum == 1) text = "……";
      if(textNum == 2) text = "いや全然　　　　　　元どおりじゃなくない！？";
      if(textNum == 3) text = "ちょっと！なんで　　プレゼント浮いたりしてるの！？";
      if(textNum == 4) text = "へんなところ　　　　いじったでしょ！";
      if(textNum == 5) text = "やり直し！　　　　　ちゃんとやり直して！";
      if(textNum == 6){
        stop();
        exit();
      }
    }
          
    return text;
  }
  
  //ゲームオーバー時の特殊なセリフ
  String uniqueText(int scene, int textNum){
    if(scene == 1){
      if(textNum == 0) text = "あ　　　　　　　　　ブロック崩しって　　やったことなかった？";
      if(textNum == 1) text = "矢印キーで　　　　　バーを動かして　　　ボールを跳ね返して";
      if(textNum == 2) text = "全部のブロックに　　ボールを当てたら　　終わりだよ";
      if(textNum == 3) text = "頑張って〜";
      if(textNum == 4) text = "end";
    }
    
    if(scene == 2){
      if(textNum == 0) text = ".............";
      if(textNum == 1) text = "僕の言ったこと　　　そんなに難しかった？";
      if(textNum == 2) text = "十字キーでバーを　　動かすんだよ";
      if(textNum == 3) text = "あ　それとも雪玉の　速さについていけない？";
      if(textNum == 4) text = "それなら...";
      if(textNum == 5) text = "がんばって慣れてくれ";
      if(textNum == 6) text = "いくよ　次エンター　キー押したら投げる　からね〜";
      if(textNum == 7) text = "end";
    }
    
    if(scene == 3){
      if(textNum == 0) text = "次エンターキー　　　押したら投げる　　　からね〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 4){
      if(textNum == 0) text = "がんばれがんばれ〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 5){
      if(textNum == 0) text = "あきらめんなよ〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 6){
      if(textNum == 0) text = "今も移動はできるからね〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 7){
      if(textNum == 0) text = "油断しないで〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 8){
      if(textNum == 0) text = "寒いと眠くなるよね";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 9){
      if(textNum == 0) text = "まだまだこれからだよ〜";
      if(textNum == 1) text = "end";
    }
    
    if(scene == 10){
      if(textNum == 0) text = "え？　なんかさっき　一気に雪が消えた　　って？";
      if(textNum == 1) text = "君の世界は　　　　　雪が一気に　　　　　消えないの？";
      if(textNum == 2) text = "それは……";
      if(textNum == 3) text = "すごく不便だね！";
      if(textNum == 4){
        text = "end";
        block.changeFlag();
      }
    }

    if(scene == 11){
      if(textNum == 0) text = "え？このゲーム　　　終わりがあるのかって？";
      if(textNum == 1) text = "当たり前だろ　何回　テストプレイしたと　思ってるの";
      if(textNum == 2) text = "もう少し　　　　　　頑張ってみてよ";
      if(textNum == 3){
        text = "end";
        ball.changeBallFlag();
      }
    }
     
      return text;
  }
}