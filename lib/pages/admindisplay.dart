import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softapp/widgets/circle_button.dart';
import 'package:softapp/widgets/create_post_contrainer.dart';
import 'package:softapp/widgets/navigation_drawer.dart';
import 'package:softapp/widgets/post_container.dart';

var now = DateTime.now();

String user_pic = "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg";

List posts = [
  {'postID': 0},
  {
    'postID': 1,
    'user_verify' : false,
    'user_pic':
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    'username': 'Username',
    'postText':
        'F*ck youaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    'attachedImageUrl': 'https://dc.lnwfile.com/_/dc/_raw/u8/0p/0u.jpg',
    'tags': ['ไอควาย', 'ปัญญาอ่อน'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
  {
    'postID': 2,
    'user_verify' : true,
    'user_pic':
        'https://cdn.discordapp.com/avatars/695875199291228181/ff8949df85c202c508357c7a0bb1acd6.webp?size=80',
    'username': '윤보미 Chaipanna',
    'postText':
        'ทำไมเด๋วนี้พี่คิงไม่ยอมให้หนูเล่นเกมด้วยเลยสนใจแต่อะไรก็ไม่รู้ รู้มั้ยว่าหนูคิดถึงพี่คิงขนาดไหน แล้วนี้เมื่อไหร่จะขอหนูเป็นแฟนหนูรอพี่คิงมาขอนานแล้วนะ งื้อๆ',
    'attachedImageUrl': '',
    'tags': ['สีชมพู', 'รักภูมิ', 'เด็กคิง'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
  {
    'postID': 3,
    'user_verify' : false,
    'user_pic':
        'https://cdn.discordapp.com/avatars/695875199291228181/ff8949df85c202c508357c7a0bb1acd6.webp?size=80',
    'username': '윤보미 Chaipanna',
    'postText':
        'ทำไมเด๋วนี้พี่คิงไม่ยอมให้หนูเล่นเกมด้วยเลยสนใจแต่อะไรก็ไม่รู้ รู้มั้ยว่าหนูคิดถึงพี่คิงขนาดไหน แล้วนี้เมื่อไหร่จะขอหนูเป็นแฟนหนูรอพี่คิงมาขอนานแล้วนะ งื้อๆ',
    'attachedImageUrl': '',
    'tags': ['สีชมพู', 'รักภูมิ', 'เด็กคิง'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
];

class admindisplay extends StatefulWidget {
  const admindisplay({Key? key}) : super(key: key);

  @override
  State<admindisplay> createState() => _admindisplayState();
}

class _admindisplayState extends State<admindisplay> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: AdminNavigateDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 222, 105, 21),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'KMITL',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'NEWS',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            CircleButton(
              icon: FaIcon(FontAwesomeIcons.gripVertical),
              iconSize: 23.0,
              onPressed: _openEndDrawer,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              child: CreatePostContrainer(
                image: NetworkImage(user_pic),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: ListView.separated(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final post = posts[index];
                    if (index == 0) return Container();
                    return PostContainer(post: post, type: 'admin');
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
