import '../../../../../../utils/constants/api_constants.dart';
import '../../../../../../utils/dio/dio_helper.dart';

class MedicalServicesRemoteDataSourceImp {
  Future<Map<String, dynamic>?> getMedicalServicesList() {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.getData(URL: URL.medicalServices);
    return response;
  }
}
