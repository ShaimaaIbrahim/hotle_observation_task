import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hotel_observation_assignment/models/room_model.dart';
import 'package:hotel_observation_assignment/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DbHelper {

 // Database? db;
 Future<String> init() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPathRooms =
        path.join(applicationDirectory.path, "hotel_observation.db");

    bool dbExistsRooms = await io.File(dbPathRooms).exists();


  //  if (!dbExistsRooms) {
      // Copy from asset
      ByteData data =
          await rootBundle.load(path.join("assets", "hotel_observation.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(dbPathRooms).writeAsBytes(bytes, flush: true);
   // }

    return dbPathRooms;
   // this.db= await openDatabase(dbPathRooms);

  }

  // get all booking rooms inside hotel branches
  Future<List<RoomModel>> getAllTheHotelRooms() async {
   Database? db ;
   await init().then((value) async{
     db= await openDatabase(value);
   });
    if (db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map<String, dynamic>>? rooms;

    await db!.transaction((txn) async {
      rooms = await txn.query(
        "Room",
        columns: ["id", "branch_name", "room_num", "type", "status", "image"],
      );
    });

    return rooms!.map((e) => RoomModel.fromJson(e)).toList();
  }

  Future<void> insertNewUser(UserModel userModel) async{
    Database? db ;
    await init().then((value) async{
      db= await openDatabase(value);
    });

    await db!.insert(
      'User',
      userModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

 Future<List<UserModel>> getAllUsers() async {
   Database? db ;
   await init().then((value) async{
     db= await openDatabase(value);
   });
   if (db == null) {
     throw "bd is not initiated, initiate using [init(db)] function";
   }
   List<Map<String, dynamic>>? users;

   await db!.transaction((txn) async {
     users = await txn.query(
       "User",
       columns: ["id", "name", "email", "password"],
     );
   });

   return users!.map((e) => UserModel.fromJson(e)).toList();
 }
}
