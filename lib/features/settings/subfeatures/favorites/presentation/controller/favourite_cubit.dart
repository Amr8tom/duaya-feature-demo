import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/check_item_model.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/remove_item_model.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/wishlist_model.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/domain/usecases/check_favourite_item_usecase.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/domain/usecases/remove_favourite_item_usecase.dart';
import 'package:meta/meta.dart';
import '../../data/model/add_item_model.dart';
import '../../domain/usecases/add_favourite_item_usecase.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final AddFavouriteItemUsecase addUsecase;
  final RemoveFavouriteItemUsecase RemoveUsecase;
  final CheckFavouriteItemUsecase checkUsecase;
  final GetWishlistItemsUsecase getUsecase;
  FavouriteCubit(
      {required this.getUsecase,
      required this.addUsecase,
      required this.RemoveUsecase,
      required this.checkUsecase})
      : super(FavouriteInitial());

  Future addFavouriteItem({required Map<String, dynamic> params}) async {
    final result = await addUsecase.call(params: params);
    return result.fold((f) => emit(FavouriteFailure()),
        (addModel) => emit(FavouriteAddSuccess(addModel: addModel)));
  }

  Future removeFavouriteItem({required Map<String, dynamic> params}) async {
    final result = await RemoveUsecase.call(params: params);
    return result.fold(
        (f) => emit(FavouriteFailure()),
        (removeModel) =>
            emit(FavouriteRemovedSuccess(removeModel: removeModel)));
  }

  Future CheckFavouriteItem({required Map<String, dynamic> params}) async {
    final result = await checkUsecase.call(params: params);
    return result.fold((f) => emit(FavouriteFailure()),
        (checkModel) => emit(FavouriteCheckSuccess(checkModel: checkModel)));
  }

  Future getAllFavouriteItem() async {
    final result = await getUsecase.call();
    return result.fold((f) => emit(FavouriteFailure()),
        (wishlist) => emit(FavouriteWishListSuccess(wishlist: wishlist)));
  }
}
