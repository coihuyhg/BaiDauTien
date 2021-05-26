import 'package:flutter/material.dart';
import 'package:flutter_app/ManHinhBinhLuan.dart';
import 'package:flutter_app/post.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  getpost() async {
    var response = await http.get(url);
    setState(() {
      posts = postFromJson(response.body);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Center(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, i) => Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${posts[i].userId}"),
                              SizedBox(height: 5.0),
                              Icon(Icons.account_circle_rounded)
                            ],
                          ),
                        ),
                        Text("...")
                      ],
                    ),
                    Text(posts[i].title),
                    SizedBox(height: 10.0),
                    Text(posts[i].body),
                    SizedBox(height: 5.0),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Comment()));
                    }, child: Text("Bình luận"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getpost,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}