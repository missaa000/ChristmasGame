public class setUp{
  void init_setup(){
    back   = loadImage("image/back.png");
    object = loadImage("image/object.png");
    
    cake1.image    = object.get(458,  99,  45,  38);
    cake2.image    = object.get(444, 229,  80,  55);
    cake3.image    = object.get(426, 368, 118,  73);
    dish.image     = object.get(406, 584, 157,  37);
    present1.image = object.get( 50,  55, 100, 110);
    present2.image = object.get( 35, 235, 120, 140);
    present3.image = object.get( 35, 435, 120, 270);
    scarf.image    = object.get(245, 410, 100,  90);
    snowman.face   = object.get(271, 569,  30,  30);
    
    Key.init();
    block.init();
    
    //日本語テキスト読み込み
    font     = createFont("MSP GOTHIC", 40, true);
    //ゲームオーバー時のランダムなテキスト表示
    textRand = 0;
    //文字表示のタイマー
    timer    = 0;
    time     = 0;
    //0:無言　その他喋る
    textType = 0;
    textFlag = true;
    textFont(font);  
   
    //音楽ロード
    song     = minim.loadFile("music/Santa_Claus_Is_Coming_to_Town.mp3");
    SE       = minim.loadFile("music/hitSE.mp3");
    //初めはタイトル画面
    gameStatus = 0;
    
  }
}