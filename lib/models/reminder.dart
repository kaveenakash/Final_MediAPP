class Reminder{
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? time;
  int? color;
  int? remind;
  String? repeat;
  int? userId;


  Reminder({this.id,this.title,this.note,this.isCompleted,this.date,this.time,this.color,this.remind,this.repeat,this.userId});

  Reminder.fromJson(Map<String,dynamic>json){

    id = json['id'];
    title = json["title"];
    note = json["note"];
    isCompleted = json["isCompleted"];
    date = json["date"];
    time = json["time"];
    color = json["color"];
    remind = json["remind"];
    repeat = json["repeat"];
    userId = json["userId"];
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['note'] = this.note;
    data['isCompleted'] = this.isCompleted;
    data['time'] = this.time;
    data['color'] = this.color;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;
    data['userId'] = this.userId;
    return data;
  }

}