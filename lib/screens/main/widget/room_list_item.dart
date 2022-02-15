import 'package:flutter/material.dart';
import 'package:hotel_observation_assignment/utils/colors.dart';
import 'package:hotel_observation_assignment/utils/common_functions.dart';
import 'package:hotel_observation_assignment/utils/texts.dart';
import 'package:hotel_observation_assignment/widgets/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_observation_assignment/widgets/styled_button.dart';

import '../../../models/room_model.dart';

class RoomListItem extends StatelessWidget {
  final RoomModel roomModel;

  const RoomListItem({Key? key, required this.roomModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkmage(url: 'https://img.freepik.com/free-photo/luxury-bedroom-suite-resort-high-rise-hotel-with-working-table_105762-1783.jpg', width: 70.w, height: 70.h,),
              widthSpace(30.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  bold20Text(roomModel.branch_name!),
                  heightSpace(5.h),
                  bold16Text(roomModel.room_num!.toString()),
                  bold14Text(roomModel.type!),
                ],
              ),
              Spacer(),
              bold16Text(roomModel.status==0 ? 'booked':  'avaiable', color:roomModel.status==0 ? Colors.red : Colors.green),
            ],
          ),
          heightSpace(20.h),
          roomModel.status==1 ?  Center(
            child: StyledButton(
              fillColor: secondaryColor,
              text: 'BOOK', function: (){

            },
            ),
          ) : Container()
        ],
      ),
    );
  }
}
