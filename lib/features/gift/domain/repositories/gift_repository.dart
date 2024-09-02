import 'package:dartz/dartz.dart';

import '../../data/model/get_clubpoint_model.dart';

abstract class GiftRepository {
  GiftRepository();
  Future<GetClubpointModel> getGiftModel();
}
