import 'package:flutter/material.dart';
import 'package:hotel_observation_assignment/enums/ScreenState.dart';
import 'package:hotel_observation_assignment/screens/BaseScreen.dart';
import 'package:hotel_observation_assignment/screens/main/viewmodel/hotels_viewmodel.dart';
import 'package:hotel_observation_assignment/utils/colors.dart';
import 'package:hotel_observation_assignment/utils/common_functions.dart';
import 'package:hotel_observation_assignment/utils/extensions.dart';
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
    return BaseScreen<HotelsViewModel>(
      builder: (_, vm, child) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkmage(
                    url:
                        'https://img.freepik.com/free-photo/luxury-bedroom-suite-resort-high-rise-hotel-with-working-table_105762-1783.jpg',
                    width: 70.w,
                    height: 70.h,
                  ),
                  widthSpace(30.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      bold20Text(roomModel.branch_name!),
                      heightSpace(5.h),
                      bold16Text(roomModel.room_num!.toString()),
                      bold14Text(roomModel.type!),
                      heightSpace(20.h),
                      roomModel.type == "suite" && roomModel.status!=0
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 30.w,
                            color: greyColor,
                          ).onTap(() {
                            vm.incresCount();
                          }),
                          widthSpace(20.w),
                          bold21Text(vm.count.toString()),
                          widthSpace(20.w),
                          Icon(
                            Icons.remove_circle_outline_outlined,
                            size: 30.w,
                            color: greyColor,
                          ).onTap(() {
                            vm.decreaseCount();
                          }),
                        ],
                      )
                          : Container(),
                    ],
                  ),
                  Spacer(),
                  bold16Text(roomModel.status == 0 ? 'booked' : 'avaiable',
                      color: roomModel.status == 0 ? Colors.red : Colors.green),
                ],
              ),
              heightSpace(20.h),
              roomModel.status == 1
                  ? vm.state ==ViewState.Busy ?  Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              ):Center(
                      child: StyledButton(
                        fillColor: secondaryColor,
                        text: 'BOOK',
                        function: () {
                          vm.observeHotel(roomModel, context);
                        },
                      ),
                    )
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
