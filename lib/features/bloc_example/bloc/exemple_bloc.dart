import 'package:bloc/bloc.dart';

part 'exemple_event.dart';
part 'exemple_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
    on<ExampleRemoveNameEvent>(_removeName);
  }

  

  Future<void> _removeName(
      ExampleRemoveNameEvent event, Emitter<ExampleState> emit) async {
    final stateExample = state;
    if (stateExample is ExampleStateData) {
      final names = stateExample.names;
      names.retainWhere((element) => element != event.name);
      emit(ExampleStateData(names: names));
    }
  }

  Future<void> _findNames(
      ExampleFindNameEvent event, Emitter<ExampleState> emit) async {
    final names = ['Renato Carianet', 'Ramon Sendino', 'Jorlex', 'Léo Lontra,'];
    emit(ExampleStateData(names: names));
  }
}
