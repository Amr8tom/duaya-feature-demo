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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.address,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorRes.appBarColor, fontSize: 30.sp),
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
                        ////////////////////////////// region //////////////////////////
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
                        ElevatedButton(
                          onPressed: () {
                            addressController.onAddressSubmitted(
                                context: context);
                            addressController.noErrors
                                ? cartController.checkOut(
                                    userID: cartController.Items![0].userId
                                        .toString())
                                : () {};
                            context.pushNamed(DRoutesName.paymentRoute);
                          },
                          child: Text(S.current.confirmAddress),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
