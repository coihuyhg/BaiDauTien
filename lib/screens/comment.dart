import 'package:flutter/material.dart';
import 'package:flutter_app/router/router_name.dart';
import 'package:flutter_app/view_model/comment_model.dart';
import 'package:provider/provider.dart';

class Comment extends StatefulWidget {
  String postId;
  Comment(this.postId);
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.pushReplacementNamed(context, RouterName.home);
        },
        ),
        backgroundColor: Colors.lightBlue,
        title: Text("Bình luận"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<CommentModel>(
        create: (_) => CommentModel(widget.postId),
        child: Consumer<CommentModel>(
          builder: (context, model, _) => Container(
              color: Colors.grey,
              child: Center(
                child: model.loading
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: model.posts.length,
                        itemBuilder: (context, i) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20.0,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "${model.posts[i].userAvatar}"),
                                        radius: 50.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(model.posts[i].userName),
                                        Text(model.posts[i].content),
                                        Text(model.posts[i].time),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
              )),
        ),
      ),
    );
  }
}
