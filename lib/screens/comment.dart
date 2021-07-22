import 'package:flutter/material.dart';
import 'package:flutter_app/routers/router_name.dart';
import 'package:flutter_app/views_model/comment_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
    return ChangeNotifierProvider<CommentModel>(
      create: (_) => CommentModel(widget.postId),
      child: Consumer<CommentModel>(
        builder: (context, model, _) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, RouterName.home);
              },
            ),
            backgroundColor: Colors.lightBlue,
            title: Text("Bình luận"),
            centerTitle: true,
          ),
          body: Container(
              color: Colors.grey,
              child: Center(
                child: model.loading
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: model.postComments.length,
                        itemBuilder: (context, i) => Slidable(
                          actionPane: SlidableScrollActionPane(),
                          actions: <Widget> [
                            IconSlideAction(
                              caption: "Edit",
                              color: Colors.greenAccent,
                              icon: Icons.edit,
                              onTap: () {},
                            ),
                            IconSlideAction(
                              caption: "Delete",
                              color: Colors.blueAccent,
                              icon: Icons.delete,
                              onTap: () {},
                            )
                          ],
                          child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20.0,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "${model.postComments[i].userAvatar}"),
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
                                          Text(model.postComments[i].userName),
                                          Text(model.postComments[i].content),
                                          Text(model.postComments[i].time),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        )),
              )),
        ),
      ),
    );
  }
}
