import 'package:bloc_test/bloc_test.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../contacts/list/bloc/contact_list_bloc_test.dart';

void main() {
  
  // declaracao
  late ContactsRepository repository;
  late ContactListCubit cubit;
  late List<ContactModel> contacts;

  // preparacao
  setUp(() {

    repository = MockContactsRepository();
    cubit = ContactListCubit(contactsRepository: repository);
    contacts = [
      ContactModel(name: "Bruno Noveli", email: "brunonoveli@deal.com.br"),
      ContactModel(name: "Bruno Zupp", email: "brunozupp@deal.com.br"),
    ];
  });

  // execução
  blocTest<ContactListCubit, ContactListCubitState>(
    "Deve buscar os contatos", 
    build: () => cubit,
    act: (cubit) => cubit.findAll(),
    setUp: () async {
      when(() => repository.findAll()).thenAnswer((_) async => contacts);
    },
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.data(contacts: contacts),
    ],
  );

  blocTest<ContactListCubit, ContactListCubitState>(
    "Deve retornar erro buscar os contatos", 
    build: () => cubit,
    act: (cubit) => cubit.findAll(),
    setUp: () async {
      when(() => repository.findAll()).thenThrow(Exception());
    },
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.error(message: "Erro ao buscar contatos"),
    ],
  );
}