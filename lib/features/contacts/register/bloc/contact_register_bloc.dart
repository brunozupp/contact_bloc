import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_register_event.dart';
part 'contact_register_state.dart';

part "contact_register_bloc.freezed.dart";

class ContactRegisterBloc extends Bloc<ContactRegisterEvent, ContactRegisterState> {

  final ContactsRepository _contactsRepository;
  
  ContactRegisterBloc({
    required ContactsRepository contactsRepository,
  }) : 
  _contactsRepository = contactsRepository,
  super(ContactRegisterState.initial()) {

    on<_ContactRegisterEventSave>(_save);
  }

  FutureOr<void> _save(_ContactRegisterEventSave event, Emitter<ContactRegisterState> emit) async {

    try {
      emit(ContactRegisterState.loading());
      
      await Future.delayed(const Duration(seconds: 1));
      
      final contactModel = ContactModel(
        name: event.name, 
        email: event.email,
      );

      
      await _contactsRepository.create(contactModel);

      print("Passou aqui do await");

      
      emit(ContactRegisterState.success());

      print("Passou aqui do emit");

    } on Exception catch (e,s) {
      log(
        "Erro ao salvar contato",
        error: e,
        stackTrace: s,
      );
      emit(ContactRegisterState.error(
        message: "Erro ao salvar contato"
      ));
    }
  }
}