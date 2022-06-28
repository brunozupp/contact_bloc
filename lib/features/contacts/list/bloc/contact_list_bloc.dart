import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';

part 'contact_list_bloc.freezed.dart';

class ContactListBloc extends Bloc<ContactListEvent,ContactListState> {

  final ContactsRepository _contactsRepository;

  ContactListBloc({
    required ContactsRepository contactsRepository,
  }) : 
  _contactsRepository = contactsRepository,
  super(ContactListState.initial()) {
    
    on<_ContactListEventFindAll>(_findAll);

    on<_ContactListEventDelete>(_delete);
  }

  FutureOr<void> _findAll(_ContactListEventFindAll event, Emitter<ContactListState> emit) async {

    try {

      emit(ContactListState.loading());

      final contacts = await _contactsRepository.findAll();
      
      emit(ContactListState.data(contacts: contacts));

    } on Exception catch (e,s) {
      log(
        "Erro ao buscar contatos",
        error: e, 
        stackTrace: s,
      );
      emit(ContactListState.error(error: "Erro ao buscar contatos"));
    }
  }

  FutureOr<void> _delete(_ContactListEventDelete event, Emitter<ContactListState> emit) async {
    try {

      emit(ContactListState.loading());
      
      await _contactsRepository.delete(event.contact);

      final contacts = await _contactsRepository.findAll();

      await Future.delayed(const Duration(seconds: 1));

      emit(ContactListState.success(message: "Contato deletado com sucesso"));
      
      emit(ContactListState.data(contacts: contacts));

    } on Exception catch (e,s) {
      log(
        "Erro ao deletar contato",
        error: e, 
        stackTrace: s,
      );
      emit(ContactListState.error(error: "Erro ao deletar contato"));
    }
  }
}