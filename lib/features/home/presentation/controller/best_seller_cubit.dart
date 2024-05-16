import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/home/data/model/bestSellerModel.dart';
import 'package:duaya_app/features/home/data/model/productModel.dart';
import 'package:duaya_app/features/home/data/repositiories/bestSellerRepo.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:meta/meta.dart';

import '../../data/model/sliderModel.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());
  late BestSellerModel bestSellerModel;
  late SliderModel slidersModel;
  late ProductModel productModel;
  String selectedSize = '';
  String selectedColor = '';
  String varient = '';
  bestSellerReposoitoryImp repo = bestSellerReposoitoryImp();
  Future fetchBestSellerData() async {
    emit(BestSellerModelloading());
    bestSellerModel = await repo.getBestSellerModel();
    emit(BestSellersuccess());

    print("////////// Best Seller Controller is working well  ////////");
  }

  Future fetchSlidersData() async {
    emit(BestSellerloading());
    slidersModel = await repo.getSlidersModel();
    print("//////////////// silder Fetch Data //////////////////////");
    emit(BestSellersuccess());
  }

  Future fetchProductData({required String productID}) async {
    emit(productModelloading());
    productModel = await repo.getProductModel(productID: productID);
    print("//////////////// Product Fetch Data //////////////////////");
    emit(productModelSuccess());
  }

  void setSize({required String Size}) {
    selectedSize = Size;
    emit((BestSellersuccess()));
  }
}
