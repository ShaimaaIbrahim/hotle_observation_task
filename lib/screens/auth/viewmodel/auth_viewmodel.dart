
import 'package:hotel_observation_assignment/db/database_helper.dart';
import 'package:hotel_observation_assignment/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../../Locator.dart';
import '../../BaseViewModel.dart';

class AuthViewModel extends BaseViewModel{


  var db = locator<DbHelper>();

  Future<void> signUp(int id, String name, String email , String password, int hasbook)async {
   db.insertNewUser(UserModel(name: name, email: email , password: password, id: 1, has_book: hasbook) ,);
  }

  int getAllUsrers(){
    int length =0;
    db.getAllUsers().then((value) {
      length = value.length;
    });
    return length;
  }

}