import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/Comment.dart';
import 'package:flutter_app/Model/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getpost();
  }
  Future<void> getpost() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var header = {"Authorization": "$tokenType $token"};
    var body = {"number": 10};
    var response = await Dio().get(
        "http://pcdashboard.herokuapp.com/post/class/4Y",
        options: Options(headers: header),
        queryParameters: body);
    print(response);
    List<Post> newpost =
        (response.data as List).map((item) => Post.fromJson(item)).toList();
    setState(() {
      posts = newpost;
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
        title: Text("Trang chu"),
          centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search)),
          IconButton(icon: Icon(Icons.notifications_active)),
        ],
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: loading == true ? CircularProgressIndicator() : ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, i) => Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20.0,
                                child: CircleAvatar(
                                  backgroundImage:
                                  NetworkImage("${posts[i].userAvatar}"),
                                  radius: 50.0,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${posts[i].userName}"),
                                    SizedBox(height: 5.0),
                                    Text(posts[i].time)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("..."),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(posts[i].content),
                    SizedBox(height: 10.0),
                    posts[i].image != null ? Image.network(posts[i].image) : Container(),
                    SizedBox(height: 5.0),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Comment()));
                        },
                        child: Text("Bình luận"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
