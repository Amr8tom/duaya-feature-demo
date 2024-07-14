import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';
import '../../authentication/presentation/signup/widgets/TextFormWidget.dart';
import '../../cart/presentation/widgets/controller/cart_cubit.dart';
import 'controller/address_cubit.dart'; // Import the AddressCubit

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
            CartCubit cartController = context.read<CartCubit>();
            // addressController.fetchLocationsData();
            return BlocConsumer<AddressCubit, AddressState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Form(
                  child: ListView(
                    children: [
                      SizedBox(height: 40.h),
                      Text(S.current.addressDetails),
                      SizedBox(height: 20.h),
                      TextField(
                        maxLines: 10,
                        controller: addressController.addressController,
                        decoration: InputDecoration(
                          hintText: S.current.addressDetails,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      ////////////////////////////// phone //////////////////////////
                      Text(S.current.phoneNumber),
                      SizedBox(height: 20.h),
                      TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          controller: addressController.phoneController,
                          decoration: InputDecoration(
                            hintText: S.current.phoneNumber,
                          )),
                      SizedBox(height: 60.h),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorRes.greenBlue,
                            borderRadius: BorderRadius.circular(100)),
                        child: ElevatedButton(
                          onPressed: () async {
                            await addressController.onAddressSubmitted(
                                ID: ID ?? "",
                                context: context,
                                countryID: "63",
                                stateID: "15508",
                                cityID: "1063",
                                isUpdate: isUpdate);
                            addressController.submitErrors
                                ? () {}
                                : context.pushNamed(
                                    DRoutesName.addNewAddressFormRoute);
                          },
                          child: Container(
                            child: Text(
                              S.current.confirmAddress,
                              style: TextStyle(color: ColorRes.white),
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
