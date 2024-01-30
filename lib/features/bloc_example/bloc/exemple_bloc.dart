import 'package:bloc/bloc.dart';

part 'exemple_event.dart';
part 'exemple_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExempleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
  }

  Future<void> _findNames(
      ExampleFindNameEvent event, Emitter<ExampleState> emit) async {
    final names = ['Renato Carianet', 'Ramon Sendino', 'Jorlex', 'Léo Lontra,'];
    emit(ExempleStateData(names: names));
  }
}
