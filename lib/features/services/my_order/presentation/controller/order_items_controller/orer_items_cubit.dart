import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orer_items_state.dart';

class OrerItemsCubit extends Cubit<OrerItemsState> {
  OrerItemsCubit() : super(OrerItemsInitial());
}
