import 'package:flutter/services.dart';
import 'package:hotel_observation_assignment/models/room_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DbHelper {
 late Database _db;

 Future<List<RoomModel>> init() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPathRooms =
        path.join(applicationDirectory.path, "hotel_observation.db");

    bool dbExistsRooms = await io.File(dbPathRooms).exists();


    if (!dbExistsRooms) {
      // Copy from asset
      ByteData data =
          await rootBundle.load(path.join("assets", "hotel_observation.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(dbPathRooms).writeAsBytes(bytes, flush: true);
    }

    this._db = await openDatabase(dbPathRooms);
    print('shaimaa===yes =============${_db.path}');
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map<String, dynamic>>? rooms;

    await _db.transaction((txn) async {
      rooms = await txn.query(
        "Room",
        columns: ["id", "branch_name", "room_num", "type", "status"],
      );
    });

    return rooms!.map((e) => RoomModel.fromJson(e)).toList();

  }

  // get all booking rooms inside hotel branches
/*  Future<List<RoomModel>> getAllTheHotelRooms() async {
    print('shaimaa===yes =============${_db.path}');
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map<String, dynamic>>? rooms;

    await _db.transaction((txn) async {
      rooms = await txn.query(
        "Room",
        columns: ["id", "branch_name", "room_num", "type", "status"],
      );
    });

    return rooms!.map((e) => RoomModel.fromJson(e)).toList();
  }*/
}
