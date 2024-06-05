import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/cart/data/model/ChangeQuantitiyModel.dart';
import 'package:duaya_app/features/cart/data/model/cartCount.dart';
import 'package:duaya_app/features/cart/data/model/cartSummary.dart';
import 'package:duaya_app/features/cart/data/model/checkOutModel.dart';
import 'package:duaya_app/features/cart/data/repositories/cartRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../../common/common_snak_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/ListItemModel.dart';
import '../../../data/model/addToCartModel.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  cartRepositoryImpl repo = cartRepositoryImpl();
  int numberOfItems = 0;
  int itemsCount = 0;
  bool hasItems = false;
  String summartTotal = "00.0";
  late addToCartModel addCartModel = addToCartModel();
  late CartCount cartCountModel;
  late CartSummary summaryModel;
  late CheckOutModel ceckOutModel;
  late ListItemModel cartItemsModel;
  late ChangeQuantitiyModel chaneQuantitiyModel;
  Map<String, Map<String, dynamic>> NewQuantitiesMap = {};
  List<CartItems> Items = [];

  Future<void> fetchCartData() async {
    cartCountModel = await repo.getCartCount();
    summaryModel = await repo.getCartSummary();
    cartItemsModel = await repo.getCartItems();
    itemsCount = cartCountModel.count!.toInt();
    itemsCount == 0 ? hasItems = false : hasItems = true;
    summartTotal = summaryModel.grandTotal.toString();
    emit(UpdatedDataSuccess());
  }

  ///////////////  its update to quantity in the cart screen ... set isAdd ture to be addition function
  updateQuantitiy({required int index, required bool isAdd}) {
    int oldQuantitiy = Items![index].quantity!;
    isAdd
        ? Items[index].quantity = oldQuantitiy + 1
        : Items[index].quantity = oldQuantitiy - 1;
    print(Items![index].quantity!);
    NewQuantitiesMap[Items![index].id.toString()] = {
      "id": Items![index].id.toString(),
      "quantity": Items[index].quantity
    };

    emit(FetechCartDataSuccess());
  }

  Future<void> saveQuantitiy() async {
    chaneQuantitiyModel = (await repo.chaneQuantitiy(
        quantitiyBody: {"items": NewQuantitiesMap.values.toList()}))!;
    print(NewQuantitiesMap.values.toList());
    summaryModel = await repo.getCartSummary();
    commonToast(chaneQuantitiyModel.results![0].message!);
    emit(SaveDataSuccess());
  }

  Future<void> fetchCartItems() async {
    Items.clear();
    await fetchCartData();
    cartItemsModel.data?.forEach((element) {
      element.cartItems?.forEach((element) {
        Items.add(element);
      });
    });
    emit(FetechCartDataSuccess());
  }

  Future<void> addToCart(
      {required String id, required String quantity, String? variant}) async {
    Map<String, dynamic> cartBody = {
      "id": id,
      "quantity": quantity,
      "variant": variant ?? ""
    };
    print(cartBody);
    addCartModel = (await repo.addToCart(cartBody: cartBody))!;
    cartCountModel = await repo.getCartCount();
    numberOfItems = 0;
    commonToast(addCartModel.message!);
    emit(AddToCartSuccess());
  }

  Future<void> deleteCart({required int cartID}) async {
    await repo.deleteCart(cartID: cartID);
    commonToast(S.current.done);
    emit(DeleteCartSuccess());
  }

  /////////////////////// CHECK OUT FUNCTION ////////////////

  Future<void> checkOut(
      {required String userID, String paymentType = "cash_on_delivery"}) async {
    Map<String, dynamic> cartBody = {"payment_type": paymentType, "id": userID};
    ceckOutModel = (await repo.checkOut(checkOutBody: cartBody))!;
    commonToast(ceckOutModel.message!);
    emit(CheckOutSuccess());
  }
  ////////////////  navigate to the address screen/////////////
  // Future<void> checkOut(
  //     {required String userID, String paymentType = "cash_on_delivery"}) async {
  //   Navigator.pushNamed(context, '/address_form');
  //   emit(CheckOutSuccess());
  // }

  void addNum() {
    emit(CartLoading());
    numberOfItems++;
    emit(CartAddSucess());
  }

  void minusNum() {
    emit(CartLoading());
    if (numberOfItems > 0) {
      numberOfItems--;
    }
    emit(CartMinusSucess());
  }
}
