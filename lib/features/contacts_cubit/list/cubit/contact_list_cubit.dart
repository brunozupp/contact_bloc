import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_cubit_state.dart';

part 'contact_list_cubit.freezed.dart';

class ContactListCubit extends Cubit<ContactListCubitState> {

  final ContactsRepository _contactsRepository;

  ContactListCubit({
    required ContactsRepository contactsRepository,
  }) : 
  _contactsRepository = contactsRepository,
  super(ContactListCubitState.initial());

  Future<void> findAll() async {
    try {
      emit(ContactListCubitState.loading());
      
      final contacts = await _contactsRepository.findAll();
            
      emit(ContactListCubitState.data(contacts: contacts));
    } on Exception catch (e,s) {
      log("Erro ao buscar contatos", error: e, stackTrace: s);
      emit(ContactListCubitState.error(message: "Erro ao buscar contatos"));
    }
  }

  Future<void> delete(ContactModel contact) async {
    try {
      emit(ContactListCubitState.loading());
      
      await _contactsRepository.delete(contact);

      final contacts = await _contactsRepository.findAll();
      
      emit(ContactListCubitState.success(message: "Contato deletado com sucesso"));
      
      emit(ContactListCubitState.data(contacts: contacts));
    } on Exception catch (e,s) {
      log("Erro ao buscar contatos", error: e, stackTrace: s);
      emit(ContactListCubitState.error(message: "Erro ao buscar contatos"));
    }
  }
}