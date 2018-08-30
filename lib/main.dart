import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<IconData> tabIcons = [
      Icons.art_track,
      Icons.supervisor_account,
      Icons.account_circle,
      Icons.notifications_none,
      Icons.menu];
    List<Tab> tabs = [];
    for (var i = 0; i < tabIcons.length; i++){
      tabs.add(Tab(icon: new Icon(tabIcons[i]),));
    }
    return new Scaffold(
      body:DefaultTabController(
        length: 5,
        child: Scaffold(
          key: _scaffoldKey,
          body: new NestedScrollView(
            controller: ScrollController(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  leading: IconButton(
                      tooltip: 'menu button',
                      icon: const Icon(Icons.camera_alt,color: Colors.white,),
                      onPressed: () => _scaffoldKey.currentState.openDrawer()),
                  actions: <Widget>[IconButton(
                      icon: const Icon(Icons.message,color: Colors.white,),
                      onPressed: () {
                      })],
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    isScrollable: false,
                    labelColor:Colors.white,
                    unselectedLabelColor: Colors.black45,
                    tabs: tabs,
                    indicatorWeight: 0.1, // 0はダメとのことで。。
                  ),
                  title: Container(
                    decoration: new BoxDecoration(
                      border: new Border(bottom: new BorderSide(color: Colors.white70))
                    ),
                    child: new TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search,color: Colors.white),
                        border: InputBorder.none,
                        hintText: '検索',
                        hintStyle: TextStyle(color:Colors.white70)
                      ),
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 66, 103, 178),
                )

              ];
            },
            body:  TabBarView(
              children: [
                MyListView(),
                MyListView(),
                MyListView(),
                MyListView(),
                MyListView(),
              ],
            ),
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the Drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(0.0),
                  height: 150.0,
                  child: DrawerHeader(
                    child: Text('User Name', style: TextStyle(color: Colors.white)),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: new DecorationImage(
                        image: new ExactAssetImage('images/back.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('ホーム',style: TextStyle(color: Colors.white),),
                    onTap: () {Navigator.of(context).pop();},
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green
                  ),
                ),
                ListTile(
                  title: Text('ニュース'),
                  onTap: () {Navigator.of(context).pop();},
                ),
                ListTile(
                  title: Text('設定'),
                  onTap: () {Navigator.of(context).pop();},
                ),
                ListTile(
                  title: Text('ガイド'),
                  onTap: () {Navigator.of(context).pop();},
                ),
                ListTile(
                  title: Text('お問い合わせ'),
                  onTap: () {Navigator.of(context).pop();},
                ),
              ],
            ),
          ),
          floatingActionButton: new FloatingActionButton(
                onPressed: () => {},
                backgroundColor: Colors.lightBlueAccent,
                child: new Stack(children: [
                  new Positioned ( // headline
                    child: new Container(
                      child: new Icon(Icons.create),
                    ),
                  ), ])
          ),
        ),
      ),
    );
  }
}


class MyListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Map> contents = [{
      "time":"78年前",
      "name":"太宰治",
      "text":"メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。"
          "メロスには政治がわからぬ。メロスは、村の牧人である。笛を吹き、羊と遊んで暮して来た。"
          "けれども邪悪に対しては、人一倍に敏感であった。きょう未明メロスは村を出発し、野を越え山越え、"
          "十里はなれた此このシラクスの市にやって来た。"
          "メロスには父も、母も無い。女房も無い。十六の、内気な妹と二人暮しだ。"},
    {
      "time":"104年前",
      "name":"夏目漱石",
      "text":"私はその人を常に先生と呼んでいた。"
          "だからここでもただ先生と書くだけで本名は打ち明けない。"
          "これは世間を憚かる遠慮というよりも、その方が私にとって自然だからである。"
          "私はその人の記憶を呼び起すごとに、すぐ「先生」といいたくなる。"
          "筆を執っても心持は同じ事である。よそよそしい頭文字などはとても使う気にならない。"},
    {
      "time":"210年前",
      "name":"ゲーテ",
      "text":"昔我が濁れる目に夙はやく浮びしことある\nよろめける姿どもよ。"
          "再び我前に近づき来たるよ。\nいでや、こたびはしも汝達なんたちを捉へんことを試みんか。"
          "\n我心猶なおそのかみの夢を懐かしみすと覚ゆや。"
          "\n汝達我に薄せまる。さらば好し。靄もやと霧との中より\n"},
    {
      "time":"101年前",
      "name":"萩原朔太郎",
      "text":"萩原君。\n　何と云つても私は君を愛する。"
          "さうして室生君を。それは何と云つても素直な優しい愛だ。"
          "いつまでもそれは永続するもので、いつでも同じ温かさを保つてゆかれる愛だ。"},
    {
      "time":"102年前",
      "name":"芥川龍之介",
      "text":"禅智内供の鼻と云えば、池の尾で知らない者はない。"
          "長さは五六寸あって上唇の上から顋の下まで下っている。形は元も先も同じように太い。"
          "云わば細長い腸詰のような物が、ぶらりと顔のまん中からぶら下っているのである。"},
    {
      "time":"128年前",
      "name":"森鴎外",
      "text":"石炭をば早や積み果てつ。中等室の卓のほとりはいと静にて、"
          "熾熱燈の光の晴れがましきも徒なり。今宵は夜毎にこゝに集ひ来る骨牌仲間も"
          "「ホテル」に宿りて、舟に残れるは余一人のみなれば。"},
    {
      "time":"117年前",
      "name":"与謝野晶子",
      "text":"この書の体裁は悉く藤島武二先生の意匠に成れり\n"
          "表紙画みだれ髪の輪郭は恋愛の矢のハートを射たる\n"
          "にて矢の根より吹き出でたる花は詩を意味せる\nなり"},
    {
      "time":"377年前",
      "name":"デカルト",
      "text":"私をしてこの書物を諸賢に呈するに至らしめました理由は極めて正當なものでありますし、"
          "諸賢もまた、私の企ての動機を理解せられました場合、この書物を諸賢の保護のもとにおかれまするに"
          "極めて正當な理由を有せられるであらうと確信いたしますので、茲にこの書物を諸賢にいはば推薦いたしまするには、"
          "私がそのなかで追求しましたことを簡單に申し述べるにしくはないと考へる次第であります。"},
    {
      "time":"136年前",
      "name":"ニーチェ",
      "text":"神は死んだ"},
    {
      "time":"123年前",
      "name":"樋口一葉",
      "text":"廻れば大門の見返り柳いと長けれど、お歯ぐろ溝に燈火うつる三階の騒ぎも手に取る如く、"
          "明けくれなしの車の行来にはかり知られぬ全盛をうらなひて、"
          "大音寺前と名は仏くさけれど、さりとは陽気の町と住みたる人の申き、"
          "三嶋神社の角をまがりてよりこれぞと見ゆる大厦もなく、かたぶく軒端の十軒長屋二十軒長や、"
          "商ひはかつふつ利かぬ処とて半さしたる雨戸の外に、"
          "あやしき形に紙を切りなして、胡粉ぬりくり彩色のある田楽みるやう"},
    {
      "time":"80年以上前",
      "name":"宮沢賢治",
      "text":"雨ニモマケズ\n風ニモマケズ\n雪ニモ夏ノ暑サニモマケヌ\n丈夫ナカラダヲモチ\n"
          "慾ハナク\n決シテ瞋ラズ\nイツモシヅカニワラッテヰル\n一日ニ玄米四合ト\n味噌ト少シノ野菜ヲタベ\n"
          "アラユルコトヲ\nジブンヲカンジョウニ入レズニ\nヨクミキキシワカリ\nソシテワスレズ\n野原ノ松ノ林ノ蔭ノ\n"
          "小サナ萓ブキノ小屋ニヰテ\n東ニ病気ノコドモアレバ\n行ッテ看病シテヤリ\n西ニツカレタ母アレバ\n"
          "行ッテソノ稲ノ朿ヲ負ヒ\n南ニ死ニサウナ人アレバ\n行ッテコハガラナクテモイヽトイヒ\n北ニケンクヮヤソショウガアレバ\n"
          "ツマラナイカラヤメロトイヒ\nヒドリノトキハナミダヲナガシ\nサムサノナツハオロオロアルキ\n"
          "ミンナニデクノボートヨバレ\nホメラレモセズ\nクニモサレズ\nサウイフモノニ\nワタシハナリタイ\n"},
    {
      "time":"112年前",
      "name":"島崎藤村",
      "text":"この書の世に出づるにいたりたるは、函館にある秦慶治氏、及び信濃にある神津猛氏のたまものなり。"
          "労作終るの日にあたりて、このものがたりを二人の恩人のまへにさゝぐ。"},

    {
      "time":"139年前",
      "name":"ドストエフスキー",
      "text":"アレクセイ・フョードロヴィッチ・カラマゾフは、この郡の地主フョードル・パーヴロヴィッチ・カラマゾフの三男で、"
          "父のフョードルは、今からちょうど十三年前に悲劇的な陰惨な最後を遂げたために、"
          "そのころ（いや、今でもやはりこちらでは時おり噂にのぼる）非常に評判の高かった人物であるが、"
          "この事件についてはいずれしかるべきところにおいてお話しすることにしよう。"},

    {
      "time":"82年前",
      "name":"江戸川乱歩",
      "text":"そのころ、東京中の町という町、家という家では、"
          "ふたり以上の人が顔をあわせさえすれば、まるでお天気のあいさつでもするように、"
          "怪人「二十面相」のうわさをしていました。\n「二十面相」というのは、毎日毎日、"
          "新聞記事をにぎわしている、ふしぎな盗賊のあだ名です。"
          "その賊は二十のまったくちがった顔を持っているといわれていました。"
          "つまり、変装へんそうがとびきりじょうずなのです。"},
    {
      "time":"103年前",
      "name":"カフカ",
      "text":"ある朝、グレゴール・ザムザが気がかりな夢から目ざめたとき、"
          "自分がベッドの上で一匹の巨大な毒虫に変ってしまっているのに気づいた。"
          "彼は甲殻のように固い背中を下にして横たわり、頭を少し上げると、"
          "何本もの弓形のすじにわかれてこんもりと盛り上がっている自分の茶色の腹が見えた。"
          "腹の盛り上がりの上には、かけぶとんがすっかりずり落ちそうになって、まだやっともちこたえていた。"
          "ふだんの大きさに比べると情けないくらいかぼそいたくさんの足が自分の眼の前にしょんぼりと光っていた。"},
    {
      "time":"1000年前",
      "name":"紫式部",
      "text":"いづれの御時（おおんとき）にか、女御（にょうご）更衣（こうい）あまた侍ひ給ひけるなかに、"
          "いとやむごとなき際（きわ）にはあらぬが、すぐれてときめき給うありけり。"
          "はじめより我はと思ひあがり給へる御方がた、めざましきものにおとしめ嫉み給ふ。"
          "同じほど、それより下﨟（げろう）の更衣たちは、まして安からず、朝夕の宮仕へにつけても、"
          "人の心をのみ動かし、恨みを負ふ積もりにやありけむ、いと篤しくなりゆき、もの心細げに里がちなるを、"
          "いよいよあかずあはれなるものに思ほして、人のそしりをもえはばからせ給はず、"
          "世のためしにもなりぬべき御もてなしなり。"},
    {
      "time":"400年前",
      "name":"シェークスピア",
      "text":"やい、グレゴリー、誓言ぢゃ、こちとらは石炭ルなんぞは擔ぐまいぞよ、假にも。（不面目な賤しい仕事なんぞはすまいぞよ）。"},
    ];
    return new Container(
        decoration: new BoxDecoration(
          color: Colors.black12
        ),
        child: ListView.builder(
      padding: EdgeInsets.all(0.0),
      itemCount: contents.length,
      itemBuilder: (BuildContext context, int index) {
        // 今何してる？
        if(index == 0) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: new BoxDecoration(
                color: Colors.white
            ),
            child: new Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(58.0)),
                      image: new DecorationImage(
                        image: new NetworkImage('https://avatars2.githubusercontent.com/u/24543260?s=460&v=4'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.all(10.0),
                    height: 44.0,
                    width: 44.0,
                  ),
                  new Expanded(child: Container(
                    height: 44.0,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.all(Radius.circular(22.0)),
                        border: new Border.all(color: Colors.black45)
                    ),
                    child: new TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.0,top: 10.0),
                        border: InputBorder.none,
                        hintText: '今なにしてる？',
                        hintStyle: TextStyle(color:Colors.black45)
                      ),
                    ),
                )),
                    new Container(
                      margin: const EdgeInsets.all(10.0),
                        child: new Icon(Icons.image,color: Colors.black45,size: 40.0,)
                    ),
                ]
            ),
            height: 80.0,
          );
        }
        // ストーリー
        if(index == 1) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: new BoxDecoration(
                color: Colors.white
            ),
            height: 126.0,
            child: Flex(direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              new Container(
                height:16.0,
                margin: EdgeInsets.only(left: 10.0,top: 10.0),
                child: new Text("ストーリー",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14.0,
                      fontWeight: FontWeight.bold,color: Colors.black54),)),
                new Container(
                    height: 100.0,
                    child:  ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                      var i = (index % 4);
                      var url = 'images/$i.jpg';
                      
                      return new Container(
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          image: new DecorationImage(
                            image: new ExactAssetImage(url),
                            fit: BoxFit.cover,
                          ),
                         ),
                      margin: const EdgeInsets.all(5.0),
                      height: 100.0,
                      width: 90.0,
                      );
              },
          ))]));
        }

        return Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: new BoxDecoration(
                color: Colors.white
            ),
            child: new Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all( 10.0),
                    decoration: new BoxDecoration(
                        color: Colors.white
                    ),
                    height: 44.0,
                    child: new Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          new Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(60.0)),
                              image: new DecorationImage(
                                image: new NetworkImage('https://avatars2.githubusercontent.com/u/24543260?s=460&v=4'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 44.0,
                            width: 44.0,
                            margin: EdgeInsets.only(right: 10.0),
                          ),
                          new Expanded(
                              child: new Flex(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              direction: Axis.vertical,
                              children: <Widget>[
                                new Expanded(child:
                                new Text(contents[index]["name"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                                new Text(contents[index]["time"],textAlign: TextAlign.left)])),
                        ]
                    ))
                  ,new Container(
                      margin: EdgeInsets.all( 10.0),
                      child: new Text(contents[index]["text"],textAlign: TextAlign.left))])
        );
      },
    ));
  }
}