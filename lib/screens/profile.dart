import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/router_name.dart';
import 'package:flutter_app/views_model/profile_model.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
        create: (_) => ProfileModel(),
        child: Consumer<ProfileModel>(
            builder: (context, model, _) => Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouterName.home);
                      },
                    ),
                    backgroundColor: Colors.lightBlue,
                    title: Text("Profile"),
                    centerTitle: true,
                    actions: [
                      IconButton(icon: Icon(Icons.settings), onPressed: () {})
                    ],
                  ),
                  body: Column(children: [
                    Center(
                        child: model.loading
                            ? CircularProgressIndicator()
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 80.0,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "${model.profile.avatar}"),
                                      radius: 79.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "${model.profile.name}",
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.perm_identity),
                                      Text("${model.profile.userId}",
                                          style: TextStyle(fontSize: 20.0))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.email),
                                      Text("${model.profile.email}",
                                          style: TextStyle(fontSize: 20.0))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.phone_android),
                                      Text(
                                        "${model.profile.phone}",
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.shopping_bag),
                                      Text(
                                          "${model.profile.role}"
                                          "/${model.profile.classId}",
                                          style: TextStyle(fontSize: 20.0))
                                    ],
                                  ),
                                ],
                              )),
                  ]),
                )));
  }
}
