import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/router_name.dart';
import 'package:flutter_app/views_model/home_model.dart';
import 'package:flutter_app/views_model/theme_model.dart';
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
            child: Container(
              child: ListView(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouterName.profile);
                    },
                    child: Text("Profile"),
                  ),
                  Row(
                    children: [
                      Text("Chế độ tối"),
                      Switch(
                          value: Provider.of<ThemeModel>(context).appTheme ==
                              AppTheme.DarkMode,
                          onChanged: (value) {
                            Provider.of<ThemeModel>(context, listen: false)
                                .changeTheme(value
                                    ? AppTheme.DarkMode
                                    : AppTheme.LightMode);
                          }),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouterName.schedule);
                      },
                      child: Text("Lịch làm việc")),
                  TextButton(
                      onPressed: () async {
                        await model.logout();
                        Navigator.pushReplacementNamed(
                            context, RouterName.login);
                      },
                      child: Text("Đăng xuất")),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.red[900],
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
                      itemCount: model.postNews.length,
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
                                                "${model.postNews[i].userAvatar}"),
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
                                                  "${model.postNews[i].userName}"),
                                              SizedBox(height: 5.0),
                                              Text(model.postNews[i].time)
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
                              Text(model.postNews[i].content),
                              SizedBox(height: 10.0),
                              model.postNews[i].image != null
                                  ? Image.network(model.postNews[i].image)
                                  : Container(),
                              SizedBox(height: 5.0),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        RouterName.comment,
                                        arguments: "${model.postNews[i].id}");
                                  },
                                  child: Text("Bình luận")),
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
