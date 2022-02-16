import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hotel_observation_assignment/enums/ScreenState.dart';
import 'package:hotel_observation_assignment/models/room_model.dart';
import 'package:hotel_observation_assignment/screens/BaseViewModel.dart';
import 'package:hotel_observation_assignment/utils/common_functions.dart';
import '../../../Locator.dart';
import '../../../db/database_helper.dart';
import '../../../models/booking_model.dart';

class HotelsViewModel extends BaseViewModel {
  int count = 0;

  incresCount() {
    if (count > 10) return;
    this.count++;
    notifyListeners();
  }

  decreaseCount() {
    if (count == 0) return;
    this.count--;
    notifyListeners();
  }

  var helper = locator<DbHelper>();

  List<RoomModel> rooms = [];

  void getAllRooms() {
    helper.getAllTheHotelRooms().then((value) {
      this.rooms = value;
      notifyListeners();
    });
  }

  void observeHotel(RoomModel model, BuildContext context) {
    setState(ViewState.Busy);
    if (model.type == "suite" && count == 0) {
      showSnackBar('You should select number of residients', context);
    } else {
      int resiendts_count = count;
      if (model.type == "double") {
        resiendts_count = 2;
      } else if (model.type == "single") {
        resiendts_count = 1;
      }
      helper
          .bookHotel(Booking(
              residents_count: resiendts_count,
              branch_name: model.branch_name,
              book_id: Random().nextInt(100) + 11,
              cost: 100.0))
          .whenComplete(() {
          model.status=0;
        helper.updateRoomAvailability(model).then((value) {
          getAllRooms();
          setState(ViewState.Idle);
        });
      });
    }
  }
}
