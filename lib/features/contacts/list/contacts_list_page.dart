import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
    
class ContactsListPage extends StatelessWidget {

  const ContactsListPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () async {
          await Navigator.of(context).pushNamed("/contact/register/");
        
          context.read<ContactListBloc>().add(
            const ContactListEvent.findAll(),
          );
        }
      ),
      body: BlocListener<ContactListBloc,ContactListState>(
        listenWhen: (previous, current) { // Adicionado essa condicional para não ficar executando o listener sem necessidade
          return current.maybeWhen(
            orElse: () => false,
            error: (error) => true,
            success: (message) => true,
          );
        },
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    error,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            },
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
            }
          );
        },
        child: RefreshIndicator(
          onRefresh: () async => context.read<ContactListBloc>()
              ..add(const ContactListEvent.findAll()),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [

                    Loader<ContactListBloc, ContactListState>(
                      selector: (state) {
                        return state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                      },
                    ),

                    BlocSelector<ContactListBloc,ContactListState,List<ContactModel>>(
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
                              onTap: () async {
                                await Navigator.pushNamed(
                                  context, 
                                  '/contact/update/',
                                  arguments: contact,
                                );

                                context.read<ContactListBloc>().add(
                                  const ContactListEvent.findAll(),
                                );
                              },
                              trailing: IconButton(
                                onPressed: () async {

                                  final confirm = await showDialog<bool?>(
                                    context: context, 
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text("Tem certeza que deseja deletar?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(false), 
                                            child: Text("Voltar"),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(true), 
                                            child: Text(
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
                                    context.read<ContactListBloc>()
                                      .add(ContactListEvent.delete(contact));
                                  }
                                }, 
                                icon: Icon(
                                  Icons.delete,
                                ),
                              ),
                              title: Text(
                                contact.name,
                              ),
                              subtitle: Text(
                                contact.email,
                              ),
                            );
                          }
                        );
                      }
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