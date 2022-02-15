import 'package:hotel_observation_assignment/models/room_model.dart';
import 'package:hotel_observation_assignment/screens/BaseViewModel.dart';

import '../../../db/database_helper.dart';

class HotelsViewModel extends BaseViewModel{


  List<RoomModel> rooms = [];

  DbHelper helper = DbHelper();
  void getAllRooms(){
    helper.getAllTheHotelRooms().then((value) {
          this.rooms = value;
          notifyListeners();
    });
  }
}