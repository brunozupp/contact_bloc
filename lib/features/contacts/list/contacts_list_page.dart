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
        onPressed: () {
          Navigator.of(context).pushNamed("/contact/register/");
        }
      ),
      body: BlocListener<ContactListBloc,ContactListState>(
        listenWhen: (previous, current) { // Adicionado essa condicional para não ficar executando o listener sem necessidade
          return current.maybeWhen(
            orElse: () => false,
            error: (error) => true,
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
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            
                            final contact = contacts[index];
                            
                            return ListTile(
                              onTap: () => Navigator.pushNamed(
                                context, 
                                '/contact/update/'
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