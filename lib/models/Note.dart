


class Note{
  String? title;
  int? id;
  String? description;


  Note({this.id,this.title,this.description});

  Note.fromJson(Map<String,dynamic>json){

    id = json['id'];
    title = json["title"];
    description = json["description"];
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }

}