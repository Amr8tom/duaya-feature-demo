import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class MedicalServicesLocalDataSource {
  Future<void> cacheMedicalServices({required String medicalServicesJson});
  Future<Map<String, dynamic>> getMedicalServices();
}

class MedicalServicesLocalDataSourceImp
    implements MedicalServicesLocalDataSource {
  @override
  Future<void> cacheMedicalServices(
      {required String medicalServicesJson}) async {
    await PrefService.putString(
        key: CacheKeys.medicalServices, value: medicalServicesJson);
  }

  @override
  Future<Map<String, dynamic>> getMedicalServices() async {
    final response =
        await PrefService.getString(key: CacheKeys.medicalServices);
    return jsonDecode(response!);
  }
}
