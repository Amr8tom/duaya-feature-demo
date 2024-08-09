import 'package:bloc/bloc.dart';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/cart/data/model/ChangeQuantitiyModel.dart';
import 'package:duaya_app/features/cart/data/model/cartCount.dart';
import 'package:duaya_app/features/cart/data/model/cartSummary.dart';
import 'package:duaya_app/features/cart/data/model/checkOutModel.dart';
import 'package:duaya_app/features/cart/data/repositories/cartRepo.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../common/common_snak_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import '../../../data/model/ListItemModel.dart';
import '../../../data/model/addToCartModel.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  cartRepositoryImpl repo = cartRepositoryImpl();
  int numberOfItems = 0;
  int itemsCount = 0;
  double total = 0;
  bool hasItems = false;
  // String summartTotal = "00.0";
  late addToCartModel addCartModel = addToCartModel();
  late CartCount cartCountModel;
  // late CartSummary summaryModel;
  late CheckOutModel ceckOutModel;
  late ListItemModel cartItemsModel;
  late ChangeQuantitiyModel chaneQuantitiyModel;
  Map<String, Map<String, dynamic>> NewQuantitiesMap = {};
  List<CartItems> Items = [];

  Future<void> fetchCartData() async {
    // summaryModel = await repo.getCartSummary();
    cartCountModel = await repo.getCartCount();
    itemsCount = cartCountModel.count!.toInt();
    itemsCount == 0 ? hasItems = false : hasItems = true;
    // summartTotal = summaryModel.grandTotal.toString();

    emit(UpdatedDataSuccess());
  }

  Future<void> fetchCartItems() async {
    cartItemsModel = await repo.getCartItems();
    Items.clear();
    await fetchCartData();
    cartItemsModel.data?.forEach((element) {
      element.cartItems?.forEach((element) {
        Items.add(element);
      });
    });
    calaTotal();
    emit(FetechCartDataSuccess());
  }

  ///////////////  its update to quantity in the cart screen ... set isAdd ture to be addition function
  updateQuantitiy({required int index, required bool isAdd}) {
    int oldQuantitiy = Items![index].quantity!;
    isAdd
        ? {
            Items[index].quantity = oldQuantitiy + 1,
            total = total + Items[index].price!.toDouble()
          }
        : {
            Items[index].quantity = oldQuantitiy - 1,
            total = total - Items[index].price!.toDouble()
          };
    print(Items![index].quantity!);
    NewQuantitiesMap[Items![index].id.toString()] = {
      "id": Items![index].id.toString(),
      "quantity": Items[index].quantity
    };

    emit(FetechCartDataSuccess());
  }

  ///     cala total
  calaTotal() {
    total = 0;
    Items.forEach((element) {
      total = total + element.price!.toDouble() * element.quantity!.toInt();
    });
    emit(ClacTotalSummary());
  }

  Future<void> saveQuantitiy() async {
    chaneQuantitiyModel = (await repo.chaneQuantitiy(
        quantitiyBody: {"items": NewQuantitiesMap.values.toList()}))!;
    print(NewQuantitiesMap.values.toList());
    print("111111111111111111111111111111111111111111111111111111111111111");
    // summaryModel = await repo.getCartSummary();
    // commonToast(chaneQuantitiyModel.results![0].message!);
    print(chaneQuantitiyModel.results?[0].message!);
    emit(SaveDataSuccess());
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
    cartCountModel = await repo.getCartCount();
    emit(DeleteCartSuccess());
  }

  /////////////////////// CHECK OUT FUNCTION ////////////////
  // $request->payment_type == 'cash_on_delivery'
  // || $request->payment_type == 'wallet'
  Future<void> checkOut(
      {required String userID,
      String paymentType = "cash_on_delivery",
      required BuildContext context}) async {
    emit(CheckOutLoading());
    CustomUI.loader(context: context);
    Map<String, dynamic> cartBody = {"payment_type": paymentType, "id": userID};
    ceckOutModel = (await repo.checkOut(checkOutBody: cartBody))!;
    if (ceckOutModel.result == true) {
      context.pushReplacementNamed(DRoutesName.navigationMenuRoute);
    } else {
      Navigator.pop(context);
      context.pushNamed(DRoutesName.companyDetailsRoute, arguments: {
        'title': ceckOutModel.message,
        // 'logo': "logo",
        'id': ceckOutModel.sellerId.toString(),
      });
      await context
          .read<CompaniesByPageCubit>()
          .fetchCompanyData(id: ceckOutModel.sellerId.toString());
    }
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
