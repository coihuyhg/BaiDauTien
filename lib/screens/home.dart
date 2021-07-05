import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/comment.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/view_model/home_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel(),
      child: Consumer<HomeModel>(
        builder: (context, model, _) => Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                Text("abc"),
                TextButton(
                    onPressed: () async {
                      await model.logout();
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text("Đăng xuất")),
              ],
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.lightBlue,
            title: Text("Trang chủ"),
            centerTitle: true,
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.notifications_active), onPressed: () {}),
            ],
          ),
          body: Container(
            color: Colors.grey,
            child: Center(
              child: model.loading
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: model.posts.length,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "${model.posts[i].userName}"),
                                              SizedBox(height: 5.0),
                                              Text(model.posts[i].time)
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
                              Text(model.posts[i].content),
                              SizedBox(height: 10.0),
                              model.posts[i].image != null
                                  ? Image.network(model.posts[i].image)
                                  : Container(),
                              SizedBox(height: 5.0),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Comment(model.posts[i].id)));
                                  },
                                  child: Text("Bình luận"))
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
