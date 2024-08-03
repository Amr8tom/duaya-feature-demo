import 'package:bloc/bloc.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/address/data/model/AdressListModel.dart';
import 'package:duaya_app/features/address/data/model/ChooseAddressModel.dart';
import 'package:duaya_app/features/address/data/model/UpdateAddressModel.dart';
import 'package:duaya_app/features/address/data/model/updateAddressCart.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/CreateAddress.dart';
import '../../data/model/DeleteAddressModel.dart';
import '../../data/repositories/addressRepo.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController postalController = TextEditingController();
  bool addressError = false;
  bool postalCodeError = false;
  bool nameCodeError = false;
  bool phoneError = false;
  bool submitErrors = false;
  int isSelected = 0;
  late CreateAddress? createAddressModel;
  late UpdateAddressModel? updateAddressModel;
  late AdressListModel? addressListModel;
  late DeleteAddressModel? deleteAddressModel;
  late ChooseAddressModel? chooseAddressModel;
  late UpdateAddressCart? UpdateAddressInCartModel;
  addressRepositoryImpl repo = addressRepositoryImpl();

  /// need to take more information about state_id from the backend
  Future<void> createAddressShipping(
      {required String countryID,
      required String stateID,
      required String cityID}) async {
    emit(AddressCreateNewLoading());
    createAddressModel = await repo.createAddressModel(AddressBody: {
      "address": addressController.text.trim(),
      "country_id": countryID,
      "state_id": stateID,
      // "name": nameController.text.trim(),
      "city_id": cityID,
      "postal_code": postalController.text.trim() ?? "0000",
      "phone": phoneController.text.trim()
    });
    emit(AddressCreateNewSuccess());
    commonToast(createAddressModel!.message.toString());
  }

  /// need to take more information about state_id from the backend
  Future<void> updateAddressShipping(
      {required String countryID,
      required String stateID,
      required String ID,
      required BuildContext context,
      required String cityID}) async {
    emit(AddressCreateNewLoading());
    updateAddressModel = await repo.updateAddressModel(AddressBody: {
      "address": addressController.text.trim(),
      "country_id": countryID,
      "state_id": stateID,
      "id": ID,
      // "name": nameController.text.trim(),
      "city_id": cityID,
      "postal_code": "0000",
      "phone": phoneController.text.trim()
    });
    // Navigator.pop(context);
    emit(AddressCreateNewSuccess());
    commonToast(updateAddressModel!.message.toString());
  }

  Future<void> onAddressSubmitted(
      {required BuildContext context,
      required String countryID,
      required bool isUpdate,
      required String stateID,
      required String ID,
      required String cityID}) async {
    addressError = false;
    phoneError = false;
    submitErrors = false;

    if (addressController.text.trim().isEmpty) {
      addressError = true;
    }
    if (phoneController.text.trim().isEmpty) {
      phoneError = true;
    }

    if (addressError || phoneError) {
      submitErrors = true;
      commonToast(S.current.pleaseEndterValue);
    } else {
      CustomUI.loader(context: context);
      isUpdate
          ? await updateAddressShipping(
              context: context,
              countryID: countryID,
              stateID: stateID,
              ID: ID,
              cityID: cityID)
          : await createAddressShipping(
              countryID: countryID, cityID: cityID, stateID: stateID);
      await fetchAddressListData();
      await context.pushNamedAndRemoveUntil(DRoutesName.AddressListRoute,
          predicate: (Route<dynamic> route) {
        return route.settings.name == DRoutesName.CartRoute;
      });
    }

    emit(AddressSubmitting());
  }

  Future<void> fetchAddressListData() async {
    emit(FetchAddressListDataLoading());
    try {
      addressListModel = await repo.getAddressListModel();
      print(addressListModel?.data?[0]);
      emit(FetchAddressListDataSuccess());
    } catch (e) {
      emit(AddressListError());
    }
  }

  /// make defult address and update address in cart
  void selectAddress({required int index, required String ID}) async {
    emit(AddressListToggleFalse());
    for (int i = 0; i < addressListModel!.data!.length!; i++) {
      addressListModel?.data?[i].setDefault = 0;
    }
    addressListModel?.data?[index].setDefault = 1;
    chooseAddressModel =
        await repo.chooseAddressFromList(addressBody: {"id": ID});
    UpdateAddressInCartModel =
        await repo.updateAddressInCartModel(AddressBody: {"address_id": ID});
    isSelected = 1;
    commonToast(chooseAddressModel!.message!);
    emit(AddressListToggleTrue());
  }

  void setDefult({required int selectValue}) {
    emit(AddressSetSelectedLoading());
    isSelected = selectValue;
    emit(AddressSetSelectedSuccess());
  }

  Future<void> deleteAddress({required int index, required String ID}) async {
    emit(AddressListDeleteError());
    addressListModel?.data?.removeAt(index);
    deleteAddressModel = await repo.deleteAddressFromList(ID: ID);
    emit(AddressListDeleteSuccess());
  }
}
