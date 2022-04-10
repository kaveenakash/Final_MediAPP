import 'package:get/get.dart';
import 'package:medicine_remainder_app/db/db_helper.dart';
import 'package:medicine_remainder_app/models/user.dart';



class UserController extends GetxController{

  @override
  void onReady(){
    super.onReady();
  }

  var userList = <User>[].obs;

  Future<int> AddUser({User? user}) async{
    return await DBHelper.insertUser(user);
  }

  void getUsers() async{
    List<Map<String, dynamic>> users = await DBHelper.getAllUsers();
    userList.assignAll(users.map((data) => new User.fromJson(data)).toList());
  }

  void deleteUser(User user){
    var val = DBHelper.deleteUser(user);
    getUsers();
  }

  void updateUser(String name,String gender,int id)async{
    await DBHelper.updateUser(name,gender,id);
    print('Updated user');
    getUsers();
  }
}