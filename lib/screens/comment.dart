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
  TextEditingController contentController;
  @override
  void initState() {
    contentController = TextEditingController();
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
          body: Stack(
            children: <Widget>[
              Container(
                color: Colors.grey,
                child: Center(
                  child: model.loading
                      ? CircularProgressIndicator()
                      : Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                itemCount: model.postComments.length,
                                itemBuilder: (context, i) => Slidable(
                                  actionPane: SlidableScrollActionPane(),
                                  actionExtentRatio: 0.25,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 20.0,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "${model.postComments[i].userAvatar}"),
                                                  radius: 50.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.grey[100],
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 10, 15, 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        "${model.postComments[i].userName}",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 5),
                                                        child: Text(
                                                            "${model.postComments[i].content}"),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, left: 15),
                                                child: Text(
                                                    "${model.postComments[i].time}"),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
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
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.deepPurple,
                                    Colors.deepPurpleAccent,
                                    Colors.blue,
                                    Colors.blueAccent,
                                  ],
                                      begin: FractionalOffset.bottomCenter,
                                      end: FractionalOffset.topCenter)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 0, 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: TextField(
                                            cursorColor: Colors.blueAccent,
                                            style: TextStyle(fontSize: 16),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Nhập bình luận",
                                                hintStyle:
                                                    TextStyle(fontSize: 16)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(Icons.send),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
