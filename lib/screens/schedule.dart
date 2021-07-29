import 'package:flutter/material.dart';
import 'package:flutter_app/routers/router_name.dart';
import 'package:flutter_app/views_model/schedule_model.dart';
import 'package:provider/provider.dart';

class Schedule extends StatefulWidget {
  String classId;
  Schedule(this.classId);
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScheduleModel>(
      create: (_) => ScheduleModel(widget.classId),
      child: Consumer<ScheduleModel>(
        builder: (context, model, _) => Container(
          color: Colors.grey,
          child: Center(
            child: model.loading
                ? CircularProgressIndicator()
                : Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouterName.home);
                        },
                      ),
                      backgroundColor: Colors.red[900],
                      title: Text("Lịch làm việc"),
                      centerTitle: true,
                    ),
                    body: Column(
                      children: <Widget>[
                        Expanded(
                            child: ListView.builder(
                          itemCount: model.postSchedule.length,
                              itemBuilder: (context, i) => Card(

                              ),
                        ))
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
