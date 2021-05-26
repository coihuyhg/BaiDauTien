import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DangNhap.dart';

class SignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500.0,
          height: 650.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign Up", style: TextStyle(fontSize: 40, color: Colors.black),),
                SizedBox(height: 45.0,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Email hoac so dien thoai",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
                SizedBox(height: 25.0,),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Nhập mật khẩu",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
                SizedBox(height: 25.0,),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Nhập lại mật khẩu",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                ),
                SizedBox(height: 35.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        textColor: Colors.blue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text("Sign Up")),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}