import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registor_event.dart';
part 'registor_state.dart';

class RegistorBloc extends Bloc<RegistorEvent, RegistorState> {
  RegistorBloc() : super(RegistorInitial()) {
    on<RegistorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
