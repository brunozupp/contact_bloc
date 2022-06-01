import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_example_page.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed_example_page.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts/list/contacts_list_page.dart';
import 'package:contact_bloc/features/contacts/register/bloc/contact_register_bloc.dart';
import 'package:contact_bloc/features/contacts/register/contact_register_page.dart';
import 'package:contact_bloc/features/contacts/update/bloc/contact_update_bloc.dart';
import 'package:contact_bloc/features/contacts/update/contact_update_page.dart';
import 'package:contact_bloc/features/contacts_cubit/list/contact_list_cubit_page.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/features/contacts_cubit/register/contact_register_cubit_page.dart';
import 'package:contact_bloc/features/contacts_cubit/register/cubit/contact_register_cubit.dart';
import 'package:contact_bloc/features/contacts_cubit/update/contact_update_cubit_page.dart';
import 'package:contact_bloc/features/contacts_cubit/update/cubit/contact_update_cubit.dart';
import 'package:contact_bloc/home/home_page.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ContactsRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/home": (_) => const HomePage(),
          "/bloc/example/": (_) => BlocProvider(
                create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
                child: const BlocExamplePage(),
              ),
          "/bloc/example/freezed/": (_) => BlocProvider(
                create: (_) => ExampleFreezedBloc()
                  ..add(const ExampleFreezedEvent.findNames()),
                child: const BlocFreezedExamplePage(),
              ),
          "/contact/list/": (_) => BlocProvider(
                create: (context) => ContactListBloc(
                  contactsRepository: context.read<ContactsRepository>(),
                )..add(const ContactListEvent.findAll()),
                child: const ContactsListPage(),
              ),
          "/contact/register/": (_) => BlocProvider(
                create: (context) => ContactRegisterBloc(
                  contactsRepository: context.read<ContactsRepository>(),
                ),
                child: const ContactRegisterPage(),
              ),
          "/contact/update/": (context) {
            
            final contact = ModalRoute.of(context)!
                .settings.arguments as ContactModel;
            
            return BlocProvider(
              create: (context) => ContactUpdateBloc(
                contactsRepository: context.read<ContactsRepository>(),
              ),
              child: ContactUpdatePage(
                contact: contact,
              ),
            );
          },
          "/contact/cubit/list/": (_) => BlocProvider(
                create: (context) => ContactListCubit(
                  contactsRepository: context.read<ContactsRepository>(),
                )..findAll(),
                child: const ContactListCubitPage(),
              ),
          "/contact/register/cubit/" :(context) => BlocProvider(
            create: (context) => ContactRegisterCubit(
              contactsRepository: context.read<ContactsRepository>(),
            ),
            child: const ContactRegisterCubitPage(),
          ),
          "/contact/update/cubit/": (context) {

            final contact = ModalRoute.of(context)!
                .settings.arguments as ContactModel;
            
            return BlocProvider(
              create: (context) => ContactUpdateCubit(
                contactsRepository: context.read<ContactsRepository>(),
              ),
              child: ContactUpdateCubitPage(
                contact: contact
              ),
            );
          }
        },
        initialRoute: "/home",
      ),
    );
  }
}
