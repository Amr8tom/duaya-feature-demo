import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/service_locator/serrvice_locator.dart';
import 'package:duaya_app/features/services/my_order/domain/usecases/get_order_details_usecase.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/follow_order/custom_back_to_home_buttom.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/follow_order/custom_follow_order_steper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../utils/connection/checkNetwork.dart';
import '../../../../../utils/dio/dio_helper.dart';
import '../../data/dataSources/local_data_sources.dart';
import '../../data/dataSources/remote_data_sources.dart';
import '../../data/repostories/repositories.dart';
import '../../domain/repositories/repositories.dart';
import '../controller/order_details_controller/order_details_cubit.dart';

class FollowOrderScreen extends StatelessWidget {
  final String orderID;
  const FollowOrderScreen({super.key, required this.orderID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<OrderDetailsCubit>(),
      child: Scaffold(
        appBar: DAppBar(
          showBackArrow: true,
          centerTitle: true,
          title: Text(S.current.followOeder),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// order status stepes
                CustomFollowOrderSteper(
                  orderID: orderID,
                ),

                /// make size
                SizedBox(
                  height: 120.h,
                ),

                /// back to home button
                const CustomBackToHomeButtom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
