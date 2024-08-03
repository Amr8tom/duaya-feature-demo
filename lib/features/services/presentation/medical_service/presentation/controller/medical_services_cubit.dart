import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/menu/presentation/medical_service/data/model/medicalServicesModel.dart';
import 'package:duaya_app/features/menu/presentation/medical_service/data/repositories/medical_repository.dart';
import 'package:meta/meta.dart';

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
