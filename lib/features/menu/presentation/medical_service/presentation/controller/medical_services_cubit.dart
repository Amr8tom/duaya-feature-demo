import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'medical_services_state.dart';

class MedicalServicesCubit extends Cubit<MedicalServicesState> {
  MedicalServicesCubit() : super(MedicalServicesInitial());
}
