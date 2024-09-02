part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteAddSuccess extends FavouriteState {
  final AddItemModel addModel;
  FavouriteAddSuccess({required this.addModel});
}

final class FavouriteRemovedSuccess extends FavouriteState {
  final RemoveItemModel removeModel;
  FavouriteRemovedSuccess({required this.removeModel});
}

final class FavouriteCheckSuccess extends FavouriteState {
  final CheckItemModel checkModel;
  FavouriteCheckSuccess({required this.checkModel});
}

final class FavouriteWishListSuccess extends FavouriteState {
  final WishlistModel wishlist;
  FavouriteWishListSuccess({required this.wishlist});
}

class FavouriteFailure extends FavouriteState {}
