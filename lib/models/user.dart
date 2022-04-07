class User{
  int? id;
  String? name;
  String? date;
  int? gender;
  int? color;

  User({this.id,this.name,this.date,this.color});

  User.fromJson(Map<String,dynamic>json){

    id = json['id'];
    name = json["name"];
    date = json["date"];
    gender = json["gender"];
    color = json["color"];
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date'] = this.date;
    data['gender'] = this.gender;
    data['color'] = this.color;
    return data;
  }

}