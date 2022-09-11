import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_database_2/model/model_user.dart';
class HiveDB{
  var box = Hive.box('pdp_online');

  storeUser(User user) async {
    box.put('user', user.toJson());
  }

  User loadUser(){
    var user = new User.fromJson(box.get('user'));
    return user;
  }
  void removeUser() async{
    box.delete('user');
  }
}