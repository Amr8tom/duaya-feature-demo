import 'package:duaya_app/common/widgets/floating_action_button/custom_floating_action_button.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../generated/l10n.dart';
import '../../../routing/routes_name.dart';
import '../../../utils/constants/colors.dart';
import '../data/model/AdressListModel.dart';
import 'controller/address_cubit.dart';

class AddressListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressListController = context.read<AddressCubit>();
    addressListController.fetchAddressListData();
    AdressListModel? addressListModel = AdressListModel();
    return Scaffold(
      appBar: DAppBar(
        leadingWidget: Icon(Icons.arrow_back_ios),
        showBackArrow: true,
        title: Text(S.current.address),
      ),
      body: BlocConsumer<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is FetchAddressListDataLoading) {
            print(state);
            return Center(
              child: Lottie.asset(AssetRes.loadingSliders),
            );
          } else if (state is AddressInitial) {
            return Center(
              child: Lottie.asset(AssetRes.loadingSliders),
            );
          } else {
            if (state is FetchAddressListDataSuccess) {
              print(state);
              addressListModel = addressListController.addressListModel;
            }
            return ListView.builder(
              itemCount: addressListModel?.data?.length ?? 0,
              itemBuilder: (context, index) {
                final country = addressListController
                    .addressListModel?.data?[index].countryName;
                final city = addressListController
                    .addressListModel?.data?[index].cityName;
                final state = addressListController
                    .addressListModel?.data?[index].stateName;
                final address = addressListController
                    .addressListModel?.data?[index].address;
                final phone =
                    addressListController.addressListModel?.data?[index].phone;
                final ID =
                    addressListController.addressListModel?.data?[index].id;
                final set_default = addressListController
                    .addressListModel?.data?[index].setDefault;
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Card(
                        elevation: 1,
                        color: set_default == 0
                            ? ColorRes.white
                            : ColorRes.greenBlueLight,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(20.w),
                          leading: IconButton(
                            onPressed: () {
                              addressListController.selectAddress(
                                  index: index, ID: ID.toString());
                            },
                            icon: Icon(
                              set_default == 1
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: set_default == 1
                                  ? ColorRes.lightGreen
                                  : Colors.grey,
                              size: 30.w,
                            ),
                          ),
                          title: Text(
                            "${state}, ${city}, ${country}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: ColorRes.error2),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${S.current.phoneNumber}: ${phone}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.w,
                                      color: ColorRes.black,
                                    ),
                              ),
                              Text(
                                "${S.current.address}: ${address}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.w,
                                      color: ColorRes.black,
                                    ),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.pushNamed(
                                    DRoutesName.addNewAddressFormRoute,
                                    arguments: {
                                      'ID': ID.toString(),
                                      'isUpdate': true,
                                    },
                                  );
                                },
                                icon: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.all(10.w),
                                    child: Icon(
                                      Icons.edit,
                                      color: ColorRes.greenBlue,
                                    ))),
                            SizedBox(
                              height: 33.w,
                            ),
                            IconButton(
                                onPressed: () {
                                  addressListController.deleteAddress(
                                      ID: ID.toString(), index: index);
                                },
                                icon: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.all(10.w),
                                    child: Icon(Icons.delete,
                                        color: ColorRes.greenBlue)))
                          ],
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          }
        },
        listener: (BuildContext context, AddressState state) {},
      ),
      floatingActionButton: Stack(children: [
        Positioned(
          left: 10,
          bottom: 70.w,
          child: CustomFloatingActionButton(
            icon: Icon(
              Icons.add_outlined,
              color: Colors.white,
            ),
            color: ColorRes.greenBlue,
            textButton: S.current.addNewAddress,
            onPressed: () => context.pushNamed(
                DRoutesName.addNewAddressFormRoute,
                arguments: {"ID": "", "isUpdate": false}),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 00.w,
          child: CustomFloatingActionButton(
            color: ColorRes.greenBlue,
            textButton: S.current.continuePayment,
            onPressed: () => context.pushNamed(DRoutesName.paymentRoute),
          ),
        ),
      ]),
    );
  }
}
