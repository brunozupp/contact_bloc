import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_freezed_event.dart';
part 'example_freezed_state.dart';

part 'example_freezed_bloc.freezed.dart';

class ExampleFreezedBloc extends Bloc<ExampleFreezedEvent,ExampleFreezedState> {

  ExampleFreezedBloc() : super(ExampleFreezedState.initial()) {
    
    on<_ExampleFreezedEventFindNames>(_findNames);

    on<_ExampleFreezedEventAddName>(_addName);

    on<_ExampleFreezedEventRemoveName>(_removeName);
  }

  FutureOr<void> _addName(
    _ExampleFreezedEventAddName event,
    Emitter<ExampleFreezedState> emit,
  ) async {

    final names = state.maybeMap<List<String>>(
      data: (value) => value.names.toList(),
      orElse: () => <String>[],
    );

    emit(ExampleFreezedState.showBanner(
      message: "Nome sendo inserido",
      names: names,
    ));

    await Future.delayed(const Duration(seconds: 2));

    names.add(event.name);

    emit(ExampleFreezedState.data(names: names.toList()));
  }

  FutureOr<void> _removeName(
    _ExampleFreezedEventRemoveName event,
    Emitter<ExampleFreezedState> emit,
  ) async {

    final names = state.maybeMap<List<String>>(
      data: (value) => value.names.toList(),
      orElse: () => <String>[],
    );

    names.retainWhere((name) => name != event.name);

    emit(ExampleFreezedState.data(names: names));
  }

  FutureOr<void> _findNames(
    _ExampleFreezedEventFindNames event, 
    Emitter<ExampleFreezedState> emit,
  ) async {

    emit(ExampleFreezedState.loading());

    final names = [
      "Bruno Noveli", 
      "Gustavo Cabral",
      "Luis Saraiva", 
      "Flutter", 
      "C#", 
      "Java"
    ];

    await Future.delayed(const Duration(seconds: 2));

    emit(ExampleFreezedState.data(names: names));
  }
}