import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/add_item_model.dart';
import 'package:duaya_app/utils/error/failure.dart';
import '../repositories/repositories.dart';

class AddFavouriteItemUsecase {
  final FavoriteRepo repository;
  AddFavouriteItemUsecase(this.repository);

  Future<Either<Failure, AddItemModel>> call({required params}) async {
    return repository.addItem(params: params);
  }
}
