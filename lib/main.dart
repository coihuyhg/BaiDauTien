import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ManHinhBinhLuan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bài viết nổi bật",
      theme: ThemeData(
          primarySwatch: Colors.grey
      ),
      home: HomePage(title: "Demo bài viết",),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super (key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}
class Post{
  String name;
  String avatar;
  String image;
  String content;

  Post(String name, String avatar, String image, String content){
    this.name = name;
    this.avatar = avatar;
    this.image = image;
    this.content = content;
  }
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [
    Post(
        "Nhà Trong Ngõ",
        "https://scontent-hkt1-1.xx.fbcdn.net/v/t1.6435-9/156053176_274199304077025_2615230071910395079_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=FvgcEt3XangAX_lzQuP&_nc_ht=scontent-hkt1-1.xx&oh=2109377b8a11c0262c5776b8f3ec655b&oe=60B5B892",
        "https://scontent-hkt1-1.xx.fbcdn.net/v/t1.6435-9/178817487_308634220633533_2895463472857085238_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=730e14&_nc_ohc=QEzAfjJYXgQAX_t0-Ml&_nc_ht=scontent-hkt1-1.xx&oh=2ee21f09fe9e5dc7f152baf4a588caf8&oe=60B2D89D",
        "Mùa hè đã đến ròi các bạng ơii, mùa hè tuyệt vời, mùa hè căng dai', mùa hè vui vãi đai'. Vậy chúng ta cần chuẩn bị những gì cho mùa hè nào? Hả gì cơ? Ồ không hãy quên mẹ mấy thứ vớ vẩn đó đi. Dưới đây là những thứ thực sự cần thiết để chuẩn bị cho mùa hè nè"
    ),
    Post(
        "Nhà Trong Ngõ",
        "https://scontent-hkt1-1.xx.fbcdn.net/v/t1.6435-9/156053176_274199304077025_2615230071910395079_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=FvgcEt3XangAX_lzQuP&_nc_ht=scontent-hkt1-1.xx&oh=2109377b8a11c0262c5776b8f3ec655b&oe=60B5B892",
        "https://scontent.fhph1-2.fna.fbcdn.net/v/t1.6435-9/179212487_312460826917539_8965726449821791858_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=730e14&_nc_ohc=_33XxEOZ7zUAX9Jal5-&_nc_ht=scontent.fhph1-2.fna&oh=899a7c35c39489fada1a6707cf15a394&oe=60B3AEDD",
        "Hạt bụi nào hóa kiếp thân tôi, để một mai quay lồng cầu số bảy.."
    ),
  ];
  int _counter = 0;
  void _incrementCounter(){
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color:  Colors.grey,
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, i) => Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                      ),
                          child: Image.network(
                            posts[i].avatar,
                            width: 50,
                            height: 50,
                          ),),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(posts[i].name),
                          Row(
                            children: [
                              Text("1 ngày ."),
                              Icon(Icons.account_circle_rounded)
                            ],
                          )
                        ],),
                      ),
                      Text("...")
                    ],
                  ),
                  Text(posts[i].content),
                  Image.network(posts[i].image),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => comment()),
                    );
                  }, child: Text("Binh luan"))
                ],
              ),
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


