import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent,ExampleState> {
  
  ExampleBloc() : super(ExampleStateInitial()) {

    on<ExampleFindNameEvent>(_findNames);

    on<ExampleRemoveNameEvent>(_removeName);
  
    on<ExampleAddNameEvent>(_addName);
  }

  FutureOr<void> _addName(
    ExampleAddNameEvent event,
    Emitter<ExampleState> emit,
  ) async {

    final stateAux = state;

    if(stateAux is ExampleStateData) {

      final names = stateAux.names.toList();

      names.add(event.name);

      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _removeName(
    ExampleRemoveNameEvent event,
    Emitter<ExampleState> emit,
  ) async {

    if(state is ExampleStateData) {
      final names = (state as ExampleStateData).names.toList();

      // Vai manter na lista todos os caras que forem falso
      names.retainWhere((name) => name != event.name);

      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _findNames(
    ExampleFindNameEvent event, 
    Emitter<ExampleState> emit,
  ) async {

    final names = [
      "Bruno Noveli", 
      "Gustavo Cabral",
      "Luis Saraiva", 
      "Flutter", 
      "C#", 
      "Java"
    ];

    await Future.delayed(const Duration(seconds: 2));

    emit(ExampleStateData(names: names));
  }

}