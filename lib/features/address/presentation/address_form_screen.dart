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
      appBar: AppBar(
        backgroundColor: ColorRes.primary,
        title: Text(
          S.current.address,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: ColorRes.white, fontSize: 30.sp),
        ),
        centerTitle: true,
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
                      SizedBox(height: 60.sp),

                      ////////////////////////////// phone //////////////////////////
                      TextWithTextField(
                        radius: 5,
                        textType: TextInputType.number,
                        isError: addressController.phoneError,
                        controller: addressController.phoneController,
                        title: S.current.phoneNumber,
                      ),
                      SizedBox(height: 20.sp),
                      TextWithTextField(
                        radius: 5,
                        hight: 150.sp,
                        isError: addressController.addressError,
                        controller: addressController.addressController,
                        title: S.current.address,
                      ),
                      SizedBox(height: 60.sp),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorRes.primary,
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
