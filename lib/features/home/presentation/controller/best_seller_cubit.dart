import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/home/data/model/bestSellerModel.dart';
import 'package:duaya_app/features/home/data/model/productModel.dart';
import 'package:duaya_app/features/home/data/repositiories/bestSellerRepo.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:meta/meta.dart';
import '../../data/model/RelatedProductModel.dart';
import '../../data/model/sliderModel.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());
  BestSellerModel bestSellerModel = BestSellerModel();
  late SliderModel slidersModel;
  late ProductModel productModel;
  bool isRelated = false;
  late RelatedProductModel relatedProduct;
  String selectedSize = '';
  int selectedColorbyimage = 0;
  int optionsLength = 0;
  int colorLength = 0;
  int indexOfVairnt = 0;

  String varient = '';
  List<Photos> varients = [];
  bestSellerReposoitoryImp repo = bestSellerReposoitoryImp();

  /// function to simplize the variable of the length of size , color ,varients the selectedSize
  /// to help to get the index of the varient
  void arrangeVarients() {
    if (productModel.data![0].photos!.length > 0 &&
        productModel.data![0].colors!.length > 0) {
      varients = productModel.data![0]!.photos!;
      optionsLength = productModel.data![0]!.choiceOptions![0].options!.length;
      colorLength = productModel.data![0]!.colors!.length;
      selectedSize = productModel.data![0]!.choiceOptions![0].options![0];
    }
  }

  /// complex equation to calc the index of the varient did by eng amr alaa ali 01011577033
  void getIndexOfVarent() {
    indexOfVairnt = selectedColorbyimage * optionsLength +
            1 +
            productModel.data![0]!.choiceOptions![0].options!
                .indexOf(selectedSize) ??
        0;
    emit(VarientSuccess());
  }

  Widget getImageArrangeImageByColorAndSize() {
    return FutureBuilder(
        future: checkImageNetwork.checkImageStatus(
            NetworkImageURL: varients[indexOfVairnt]!.path!),
        builder: (context, snapshot) {
          print(varients.length);
          Widget imageWidget;
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError ||
              !snapshot.data!) {
            imageWidget = SizedBox();
          } else {
            imageWidget = Image.network(
              varients[indexOfVairnt]!.path!,
              height: 250.sp,
            );
          }
          return Center(child: imageWidget);
        });
  }

  Widget getNormalImage({required String imgPath}) {
    return FutureBuilder(
        future: checkImageNetwork.checkImageStatus(NetworkImageURL: imgPath),
        builder: (context, snapshot) {
          Widget img;
          if (snapshot.connectionState == ConnectionState.waiting) {
            img = Lottie.asset(AssetRes.emptyProduct2, height: 250.sp);
          } else if (snapshot.hasError || !snapshot.data!) {
            img = Lottie.asset(AssetRes.emptyProduct2, height: 250.sp);
          } else {
            img = Image.network(
              imgPath,
              height: 250.sp,
            );
          }
          return img;
        });
  }

  Future fetchBestSellerData() async {
    emit(BestSellerInitial());
    bestSellerModel = await repo.getBestSellerModel();
    emit(BestSellersuccess());
    print("////////// Best Seller Controller is working well  ////////");
  }

  Future fetchSlidersData() async {
    emit(BestSellerInitial());
    slidersModel = await repo.getSlidersModel();
    print("//////////////// silder Fetch Data //////////////////////");
    emit(SlidersSuccess());
  }

  Future fetchProductData({required String productID}) async {
    emit(productModelloading());
    // clearData();
    productModel = await repo.getProductModel(productID: productID);
    arrangeVarients();
    print("//////////////// Product Fetch Data //////////////////////");
    emit(productModelSuccess());
  }

  Future fetchRelatedProductData({required String productID}) async {
    emit(RelatedProductLoading());
    isRelated = false;
    relatedProduct = await repo.getRelatedModel(productID: productID);
    isRelated = true;
    print("//////////////// Related Product Fetched  //////////////////////");

    emit(RelatedProductSuccess());
  }

  void setSize({required String Size}) {
    selectedSize = Size;
    getIndexOfVarent();
    varient = "${productModel.data![0].photos![indexOfVairnt].variant}";
    emit((getSize()));
  }

  void setColor({required int color}) {
    selectedColorbyimage = color;
    getIndexOfVarent();
    varient = "${productModel.data![0].photos![indexOfVairnt].variant}";
    emit((SetColorSuccess()));
  }

  void clearData() {
    selectedColorbyimage = 0;
    indexOfVairnt = 0;
    optionsLength = 0;
    colorLength = 0;
    selectedSize = "";
    // isRelated = false;
    varients.clear();
    varient = '';
    productModel = ProductModel();
    relatedProduct = RelatedProductModel();
    emit(setSizeproductSuccess());
  }
}
