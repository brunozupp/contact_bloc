import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_register_state.dart';
part 'contact_register_cubit.freezed.dart';

class ContactRegisterCubit extends Cubit<ContactRegisterState> {

  final ContactsRepository _contactsRepository;

  ContactRegisterCubit({
    required ContactsRepository contactsRepository,
  }) : 
  _contactsRepository = contactsRepository,
  super(const ContactRegisterState.initial());

  Future<void> save(ContactModel contact) async {

    try {
      emit(const ContactRegisterState.loading());
      
      await _contactsRepository.create(contact);
      
      await Future.delayed(const Duration(seconds: 1));
      
      emit(const ContactRegisterState.success());
    } on Exception catch (e,s) {
      log("Não foi possível salvar contato", error: e, stackTrace: s);
      emit(const ContactRegisterState.error(
        error: "Não foi possível salvar contato",
      ));
    }
  }
}
