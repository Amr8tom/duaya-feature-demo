import 'package:bloc/bloc.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/services/presentation/expire_product/data/model/expiredList.dart';
import 'package:duaya_app/features/services/presentation/expire_product/data/model/CreateExpiredModel.dart';
import 'package:duaya_app/features/services/presentation/expire_product/data/model/updateEXpiredModel.dart';
import 'package:duaya_app/features/services/presentation/expire_product/data/repositories/repository.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../generated/l10n.dart';
import '../../data/model/deleteExpired.dart';

part 'expired_products_state.dart';

class ExpiredProductsCubit extends Cubit<ExpiredProductsState> {
  ExpiredProductsCubit() : super(ExpiredProductsInitial());
  ExpiredListModel expiredListModel = ExpiredListModel();
  late CreateExpiredModel createExpiredModel;
  late UpdateEXpiredModel updateExpiredModel;
  late DeleteExpired deleteExpiredModel;
  TextEditingController unitPrice = TextEditingController();
  TextEditingController categoryId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController currentStock = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController expiredDate = TextEditingController();

  bool isNewProduct = true;
  bool errorUnit_price = false;
  bool errorCategory_id = false;
  bool errorName = false;
  bool errorCurrent_stock = false;
  bool errorDescription = false;
  bool errorExpiredDate = false;

  ExpiredProductRepository repo = ExpiredProductRepository();

  Future<void> fetchExpiredListData() async {
    emit(ExpiredProductsListLoading());
    expiredListModel = await repo.getExpiredListModel();
    emit(ExpiredProductsListSuccess());
  }

  Future<void> fetchCreateExpiredProduct() async {
    emit(ExpiredProductsCreateLoading());

    createExpiredModel =
        (await repo.createNewExpiredProduct(CreateExpiredJson: {
      "name": name.text.trim(),
      "category_id": categoryId.text.trim(),
      "expired_date": expiredDate.text.trim(),
      "unit_price": unitPrice.text.trim(),
      "current_stock": currentStock.text.trim(),
      "description": description.text.trim()
    }))!;
    commonToast(createExpiredModel.message!);
    emit(ExpiredProductsCreateSuccess());
  }

  Future<void> fetchUpdateExpiredProduct({required String ID}) async {
    emit(ExpiredProductsUpdateLoading());
    updateExpiredModel =
        (await repo.UpdateExistExpiredProduct(updateExpiredJson: {
      "name": name.text.trim(),
      "category_id": categoryId.text.trim(),
      "expired_date": expiredDate.text.trim(),
      "unit_price": unitPrice.text.trim(),
      "current_stock": currentStock.text.trim(),
      "description": description.text.trim()
    }, ID: ID))!;
    commonToast(updateExpiredModel.message!);
    emit(ExpiredProductsUpdateSuccess());
  }

  /// delete Expired Existing Product
  Future<void> fetchDeleteExpiredProduct({required String ID}) async {
    emit(ExpiredProductsDeleteLoading());
    deleteExpiredModel = (await repo.deleteExistExpiredProduct(ID: ID))!;
    commonToast(deleteExpiredModel.message!);
    emit(ExpiredProductsDeleteSuccess());
  }

  void clearData() {
    unitPrice.clear();
    categoryId.clear();
    name.clear();
    currentStock.clear();
    description.clear();
    expiredDate.clear();
  }

  Future<void> onSubmit(
      {required BuildContext context,
      required bool isUpdate,
      String? ID}) async {
    errorUnit_price = false;
    errorName = false;
    errorCurrent_stock = false;
    errorDescription = false;
    errorExpiredDate = false;
    if (name.text.trim().isEmpty) {
      errorName = true;
    }
    if (unitPrice.text.trim().isEmpty) {
      errorUnit_price = true;
    }

    if (currentStock.text.trim().isEmpty) {
      errorCurrent_stock = true;
    }
    if (description.text.trim().isEmpty) {
      errorDescription = true;
    }
    if (expiredDate.text.trim().isEmpty) {
      errorExpiredDate = true;
    }

    if (errorName ||
        errorUnit_price ||
        errorCurrent_stock ||
        errorDescription ||
        errorExpiredDate) {
      emit(ExpiredProductsSibmitFaliure());
      commonToast(S.current.pleaseEndterValue);
    } else {
      isUpdate
          ? await fetchUpdateExpiredProduct(ID: ID!)
          : await fetchCreateExpiredProduct();
      Navigator.pop(context);
      Navigator.pop(context);
      fetchExpiredListData();
    }

    emit(ExpiredProductsSibmitSuccess());
  }

  DateTime? _selectedDate;

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000), // Change this as needed
      lastDate: DateTime(2025), // Change this as needed
    );
    if (picked != null && picked != _selectedDate) {
      emit(ExpiredProductsSibmitSuccess());
      _selectedDate = picked;
      expiredDate.text = _selectedDate.toString();
      emit(ExpiredProductsSibmitSuccess());
    }
  }
}
