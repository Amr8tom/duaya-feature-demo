import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/remove_item_model.dart';
import 'package:duaya_app/utils/error/failure.dart';
import '../repositories/repositories.dart';

class RemoveFavouriteItemUsecase {
  final FavoriteRepo repository;
  RemoveFavouriteItemUsecase(this.repository);

  Future<Either<Failure, RemoveItemModel>> call({required params}) async {
    return repository.removeItem(params: params);
  }
}
