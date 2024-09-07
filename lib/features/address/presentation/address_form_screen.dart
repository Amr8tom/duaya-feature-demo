import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/authentication/presentation/controller/auth_controller_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';
import 'controller/address_cubit.dart';

// Import the AddressCubit

class AddressFormScreen extends StatelessWidget {
  bool isUpdate;
  String? ID;
  AddressFormScreen({this.ID, this.isUpdate = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        leadingWidget: Icon(Icons.arrow_back_ios),
        showBackArrow: true,
        title: Text(S.current.address),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            AddressCubit addressController = context.read<AddressCubit>();
            final authController = context.read<AuthControllerCubit>();

            return BlocConsumer<AddressCubit, AddressState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Form(
                  child: ListView(
                    children: [
                      /// white space
                      SizedBox(height: 40.h),

                      /// place name
                      TextField(
                        controller: addressController.placeNameController,
                        keyboardType: TextInputType.text,
                        decoration:
                            InputDecoration(labelText: S.current.placeName),
                      ),
                      SizedBox(height: 20.h),

                      /// place street name
                      TextField(
                        controller: addressController.streetNameController,
                        keyboardType: TextInputType.text,
                        decoration:
                            InputDecoration(labelText: S.current.streetName),
                      ),
                      SizedBox(height: 20.h),

                      ///  building number
                      TextField(
                        controller: addressController.buildingNumController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: S.current.buildingNumber),
                      ),
                      SizedBox(height: 20.h),

                      /// place TombStone
                      TextField(
                        controller: addressController.tombstoneController,
                        keyboardType: TextInputType.text,
                        decoration:
                            InputDecoration(labelText: S.current.Tombstone),
                      ),
                      SizedBox(height: 20.h),

                      /// place phone
                      TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: S.current.placeNumber),
                        controller: addressController.placePhoneController,
                      ),
                      SizedBox(height: 20.h),

                      /// evening shift phone
                      TextField(
                        controller: addressController.eveiningPhoneController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: S.current.eveningShift),
                      ),
                      SizedBox(height: 20.h),

                      /// morning shift phone
                      TextField(
                        controller: addressController.moriningPhoneController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: S.current.MorningShift),
                      ),

                      SizedBox(height: 60.h),

                      /// submit button
                      Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: ColorRes.greenBlue,
                            borderRadius: BorderRadius.circular(100)),
                        child: InkWell(
                          onTap: () async {
                            await addressController.onAddressSubmitted(
                                ID: ID ?? "",
                                context: context,
                                countryID: authController
                                    .userModel.user!.countryID
                                    .toString(),
                                stateID: authController.userModel.user!.stateID
                                    .toString(),
                                cityID: authController.userModel.user!.cityID
                                    .toString(),
                                isUpdate: isUpdate);
                          },
                          child: Center(
                            child: Container(
                              child: Text(
                                S.current.confirmAddress,
                                style: TextStyle(color: ColorRes.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
