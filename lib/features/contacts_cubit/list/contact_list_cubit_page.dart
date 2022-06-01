import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListCubitPage extends StatelessWidget {
  const ContactListCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Cubit List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () async {
          await Navigator.of(context).pushNamed("/contact/register/cubit/");

          context.read<ContactListCubit>().findAll();
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ContactListCubit>().findAll();
        },
        child: BlocListener<ContactListCubit, ContactListCubitState>(
          listenWhen: (previous,current) {
            return current.maybeWhen(
              error: (_) => true,
              success: (_) => true,
              orElse: () => false,
            );
          },
          listener: (context, state) {
            state.whenOrNull(
              success: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            );
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    Loader<ContactListCubit, ContactListCubitState>(
                      selector: (state) {
                        return state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                      },
                    ),
                    BlocSelector<ContactListCubit, ContactListCubitState,
                        List<ContactModel>>(
                      selector: (state) {
                        return state.maybeWhen(
                          data: (contacts) => contacts,
                          orElse: () => [],
                        );
                      },
                      builder: (context, contacts) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            final contact = contacts[index];

                            return ListTile(
                              title: Text(contact.name),
                              subtitle: Text(contact.email),
                              onTap: () async {
                                
                                await Navigator.of(context).pushNamed(
                                  "/contact/update/cubit/",
                                  arguments: contact,
                                );

                                context.read<ContactListCubit>().findAll();
                              },
                              trailing: IconButton(
                                onPressed: () async {

                                  final confirm = await showDialog<bool?>(
                                    context: context, 
                                    builder: (context) {
                                      return AlertDialog(
                                        content: const Text("Tem certeza que deseja deletar?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(false), 
                                            child: const Text("Voltar"),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(true), 
                                            child: const Text(
                                              "Deletar",
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  ) ?? false;

                                  if(confirm) {
                                    context.read<ContactListCubit>().delete(contact);
                                  }
                                }, 
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
