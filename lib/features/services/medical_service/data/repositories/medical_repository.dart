import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';

import 'package:duaya_app/features/address/data/model/CreateAddress.dart';

import '../../../../../../utils/connection/checkNetwork.dart';
import '../data_sources/local_data_sources.dart';
import '../data_sources/remote_data_sources.dart';
import '../model/medicalServicesModel.dart';

class MedicalServicesRepositoryImpl {
  final MedicalServicesLocalDataSourceImp localData =
      MedicalServicesLocalDataSourceImp();
  final MedicalServicesRemoteDataSourceImp remoteData =
      MedicalServicesRemoteDataSourceImp();
  MedicalServicesRepositoryImpl();
  Future<MedicalServicesModel?> getMedicalServicesList() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////// Net Connected ///////////////");
      Map<String, dynamic>? response =
          await remoteData.getMedicalServicesList();
      localData.cacheMedicalServices(medicalServicesJson: jsonEncode(response));
      return MedicalServicesModel.fromJson(response);
    } else {
      print("///////// Net Is Not Connected ///////////////");
      final response = localData.getMedicalServices();
      return MedicalServicesModel.fromJson(response);
    }
  }
}
