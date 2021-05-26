import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:
            Container(
              height: 650.0,
              width: 500.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Comments", style: TextStyle(fontSize: 30.0)),
                        SizedBox(width: 15.0,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          child: Text("34", style: TextStyle(fontSize: 15.0),),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("X")
                            ],
                          ),
                        )
                      ],
                    )
                  ],

                ),
              ),
            )
        )
    );
  }
}