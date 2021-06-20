import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/CommentRespon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Comment extends StatefulWidget {
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<CommentRespon> posts = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getComment();
  }

  getComment() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String token = pre.getString("token");
    String tokenType = pre.getString("tokenType");
    var header = {"Authorization": "$tokenType $token"};
    var response = await Dio().get(
        "http://pcdashboard.herokuapp.com/comment/9afede43-aa8e-446a-ad35-2f74be5aa389",
        options: Options(headers: header));
    print(response);
    List<CommentRespon> newComment = (response.data as List)
        .map((item) => CommentRespon.fromJson(item))
        .toList();
    setState(() {
      posts = newComment;
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Bình luận"),
        centerTitle: true,
      ),
      body: Container(
          child: Center(
        child: loading == true
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, i) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(posts[i].userName),
                                Text(posts[i].content),
                                Text(posts[i].time),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
      )),
    );
  }
}
