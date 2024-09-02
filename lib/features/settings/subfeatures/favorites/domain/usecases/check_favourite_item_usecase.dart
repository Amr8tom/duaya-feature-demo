import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/check_item_model.dart';
import 'package:duaya_app/utils/error/failure.dart';
import '../repositories/repositories.dart';

class CheckFavouriteItemUsecase {
  final FavoriteRepo repository;
  CheckFavouriteItemUsecase(this.repository);

  Future<Either<Failure, CheckItemModel>> call({required params}) async {
    return repository.checkItem(params: params);
  }
}
