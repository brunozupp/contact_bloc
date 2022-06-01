import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_update_state.dart';
part 'contact_update_cubit.freezed.dart';

class ContactUpdateCubit extends Cubit<ContactUpdateState> {

  final ContactsRepository _contactsRepository;

  ContactUpdateCubit({
    required ContactsRepository contactsRepository,
  }) : 
  _contactsRepository = contactsRepository,
  super(const ContactUpdateState.initial());

  Future<void> save(ContactModel contact) async {

    try {
      emit(const ContactUpdateState.loading());
        
      await _contactsRepository.update(contact);
      
      await Future.delayed(const Duration(seconds: 1));
      
      emit(const ContactUpdateState.success());
    } on Exception catch (e,s) {
      
      log("Erro ao atualizar contato", error: e, stackTrace: s);

      emit(const ContactUpdateState.error(message: "Erro ao atualizar contato"));
    }
  }
}
