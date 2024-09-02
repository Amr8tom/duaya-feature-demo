import 'package:duaya_app/features/settings/subfeatures/favorites/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../../data/model/wishlist_model.dart';

class GetWishlistItemsUsecase {
  final FavoriteRepo repository;
  GetWishlistItemsUsecase(this.repository);
  Future<Either<Failure, WishlistModel>> call() async {
    return repository.getWishListModel();
  }
}
