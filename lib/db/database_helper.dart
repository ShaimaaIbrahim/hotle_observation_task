
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_observation_assignment/models/booking_model.dart';
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

    String dbPathHotel =
        path.join(applicationDirectory.path, "hotel_observation.db");

    bool dbExistsHotel = await io.File(dbPathHotel).exists();

    //  if (!dbExistsRooms) {
    // Copy from asset
    ByteData data =
        await rootBundle.load(path.join("assets", "hotel_observation.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await io.File(dbPathHotel).writeAsBytes(bytes, flush: true);
    // }

    return dbPathHotel;
  }

  // get all booking rooms inside hotel branches
  Future<List<RoomModel>> getAllTheHotelRooms() async {
    Database? db;
    await init().then((value) async {
      db = await openDatabase(value);
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

  //insert new user to exist database
  Future<void> insertNewUser(UserModel userModel) async {
    Database? db;
    await init().then((value) async {
      db = await openDatabase(value);
    });

    await db!.insert(
      'User',
      userModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //get all users into database
  Future<List<UserModel>> getAllUsers() async {
    Database? db;
    await init().then((value) async {
      db = await openDatabase(value);
    });
    if (db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map<String, dynamic>>? users;

    await db!.transaction((txn) async {
      users = await txn.query(
        "User",
        columns: ["id", "name", "email", "password", "has_book"],
      );
    });

    return users!.map((e) => UserModel.fromJson(e)).toList();
  }

  //for make booking to user
  Future<void> bookHotel(Booking booking) async {
    Database? db;
    await init().then((value) async {
      db = await openDatabase(value);
    });

    await db!.insert(
      'Booking',
      booking.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //update room status after booking
  Future<void> updateRoomAvailability(RoomModel model) async {
    Database? db;
    await init().then((value) async {
      db = await openDatabase(value);
    });

    await db!.update(
     'Room',
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id]
    );
  }

  Future<bool> checkUserExiatence(String email)async{
    bool exist  = false;
    Database? db;
    await init().then((value) async {
      db = await openDatabase(value);
    });
    db!.query('User', where: "email LIKE '%$email%'").then((value) {
      if(value.length > 0){
        exist = true;
        print("shaimaaa====================${value[0].toString()}");
      }
    });
    print("shaimaaa====================$exist");
    return exist;
  }
}
