import 'package:flutter/material.dart';
import 'package:hotel_observation_assignment/db/database_helper.dart';
import 'package:hotel_observation_assignment/screens/BaseScreen.dart';
import 'package:hotel_observation_assignment/screens/main/viewmodel/hotels_viewmodel.dart';
import 'package:hotel_observation_assignment/screens/main/widget/room_list_item.dart';
import 'package:hotel_observation_assignment/utils/colors.dart';
import 'package:hotel_observation_assignment/utils/common_functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_observation_assignment/widgets/search_text_field.dart';

import '../../Locator.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HotelsViewModel>(
      onModelReady: (_) async{
        _.getAllRooms();
      },
      builder: (_, vm, child){
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(20.h),
                    Center(
                        child: SearchTextField()),
                    heightSpace(20.h),
                   vm.rooms.length==0? Center(
                     child: CircularProgressIndicator(
                       color: primaryColor,
                     ),

                   ): ListView.separated(
                      itemCount: vm.rooms.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (_,index){
                        return RoomListItem(
                          roomModel: vm.rooms[index],
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                    },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }
}
