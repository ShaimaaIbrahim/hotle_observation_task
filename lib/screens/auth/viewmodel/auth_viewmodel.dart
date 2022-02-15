
import 'package:hotel_observation_assignment/db/database_helper.dart';
import 'package:hotel_observation_assignment/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../../Locator.dart';
import '../../BaseViewModel.dart';

class AuthViewModel extends BaseViewModel{



  Future<void> signUp(String name, String email , String password)async {
    //final db = await database;

   locator<DbHelper>().insertNewUser(UserModel(name: name, email: email , password: password, id: 1, has_book: 0) ,);
  }

}