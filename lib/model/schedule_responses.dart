import 'dart:convert';

List<ScheduleRespon> scheduleResponsesFromJson(String str) => List<ScheduleRespon>.from(json.decode(str).map((x) => ScheduleRespon.fromJson(x)));

String scheduleResponsesToJson(List<ScheduleRespon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduleRespon {
  ScheduleRespon({
    this.day,
    this.subjects,
  });

  String day;
  List<Subject> subjects;

  factory ScheduleRespon.fromJson(Map<String, dynamic> json) => ScheduleRespon(
    day: json["day"],
    subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
  };
}

class Subject {
  Subject({
    this.id,
    this.time,
    this.subject,
    this.teacherOrClass,
    this.day,
    this.classId,
    this.teacherId,
  });

  String id;
  String time;
  String subject;
  String teacherOrClass;
  String day;
  String classId;
  String teacherId;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    time: json["time"],
    subject: json["subject"],
    teacherOrClass: json["teacherOrClass"],
    day: json["day"],
    classId: json["classId"],
    teacherId: json["teacherId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "time": time,
    "subject": subject,
    "teacherOrClass": teacherOrClass,
    "day": day,
    "classId": classId,
    "teacherId": teacherId,
  };
}
