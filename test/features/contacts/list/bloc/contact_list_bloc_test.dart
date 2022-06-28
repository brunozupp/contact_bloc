import 'package:bloc_test/bloc_test.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

void main() {
  
  // declaracao
  late ContactsRepository repository;
  late ContactListBloc bloc;
  late List<ContactModel> contacts;

  // preparacao
  setUp(() {

    repository = MockContactsRepository();
    bloc = ContactListBloc(contactsRepository: repository);
    contacts = [
      ContactModel(name: "Bruno Noveli", email: "brunonoveli@deal.com.br"),
      ContactModel(name: "Bruno Zupp", email: "brunozupp@deal.com.br"),
    ];
  });

  // execução
  blocTest<ContactListBloc, ContactListState>(
    "Deve buscar os contatos", 
    build: () => bloc,
    act: (bloc) => bloc.add(const ContactListEvent.findAll()),
    setUp: () async {
      when(() => repository.findAll()).thenAnswer((_) async => contacts);
    },
    expect: () => [
      ContactListState.loading(),
      ContactListState.data(contacts: contacts),
    ],
  );

  blocTest<ContactListBloc, ContactListState>(
    "Deve retornar erro ao buscar os contatos", 
    build: () => bloc,
    act: (bloc) => bloc.add(const ContactListEvent.findAll()),
    setUp: () async {
      when(() => repository.findAll()).thenThrow(Exception());
    },
    expect: () => [
      ContactListState.loading(),
      ContactListState.error(error: "Erro ao buscar contatos"),
    ],
  );

}