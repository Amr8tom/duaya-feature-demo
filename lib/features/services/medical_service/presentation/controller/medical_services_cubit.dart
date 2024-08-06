import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/medicalServicesModel.dart';
import '../../data/repositories/medical_repository.dart';

part 'medical_services_state.dart';

class MedicalServicesCubit extends Cubit<MedicalServicesState> {
  MedicalServicesCubit() : super(MedicalServicesInitial());
  late MedicalServicesModel medicalServicesModel;
  MedicalServicesRepositoryImpl repo = MedicalServicesRepositoryImpl();

  Future<void> fetchMedicalServicesList() async {
    emit(MedicalServicesGetListLoading());
    medicalServicesModel = (await repo.getMedicalServicesList())!;
    emit(MedicalServicesGetListSuccess());
  }
}
