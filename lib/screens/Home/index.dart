///HomeView
///HomeViewではユーザーが恋人モードか友達・家族モードを選択することができる

import 'package:flutter/material.dart';
import 'package:spajam2022/screens/prepare/index.dart';
import 'package:spajam2022/components/background/index.dart';
import 'package:spajam2022/utils/style.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
          SingleChildScrollView(
            child: Column(
              children: [
                // Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 100,
                    bottom: 15,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: .9,
                  ),
                ),
                mode_select_button("恋人モード", "過去に好きだった人と勝手に付き合いませんか？",
                    "assets/images/love.jpeg"),
                mode_select_button("友達・家族モード", "友達・家族との楽しい思い出を作りませんか？",
                    "assets/images/family.jpeg"),
                // Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//恋人モードか友達・家族モードを選ぶ際のカードレイアウト
class mode_select_button extends StatelessWidget {
  String mode_name = "";
  String description = "";
  String url = "";
  mode_select_button(String mode_name, String description, String url) {
    this.mode_name = mode_name;
    this.description = description;
    this.url = url;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 520,
        height: 200,
        // const(コンパイル定数)を定義できる
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white, // Cardの背景色
          margin: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
          ), // Cardの外側の余白を設定するオプション
          elevation: 2, // 影の離れ具合を調整するオプション
          shadowColor: Colors.black, // 影の色を設定するオプション
          child: Row(
            children: <Widget>[
              Image.asset(
                this.url,
                width: 170,

              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: 10),
                      child: Text("$mode_name",
                          style: TextStyle(
                            fontFamily: 'AniFont',
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "$description",
                        style: TextStyle(
                            fontFamily: 'AniFont',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade600),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PrepareView()));
      },
    );
  }
}
