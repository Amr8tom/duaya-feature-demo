import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'short_coming_state.dart';

class ShortComingCubit extends Cubit<ShortComingState> {
  ShortComingCubit() : super(ShortComingInitial());
}
