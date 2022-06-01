import 'package:contact_bloc/features/contacts_cubit/register/cubit/contact_register_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactRegisterCubitPage extends StatefulWidget {
  const ContactRegisterCubitPage({Key? key}) : super(key: key);

  @override
  State<ContactRegisterCubitPage> createState() =>
      _ContactRegisterCubitPageState();
}

class _ContactRegisterCubitPageState extends State<ContactRegisterCubitPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Register Cubit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocListener<ContactRegisterCubit, ContactRegisterState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                Navigator.of(context).pop();
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
              },
            );
          },
          listenWhen: (previous, current) {
            return current.maybeWhen(
              success: () => true,
              error: (_) => true,
              orElse: () => false,
            );
          },
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Loader<ContactRegisterCubit, ContactRegisterState>(
                    selector: (state) {
                  return state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );
                }),
                TextFormField(
                  controller: _nameEC,
                  decoration: const InputDecoration(
                    label: Text(
                      "Nome",
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nome é Obrigatório";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailEC,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text(
                      "Email",
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email é Obrigatório";
                    }

                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    final validate = _formKey.currentState?.validate() ?? false;

                    if (validate) {
                      context.read<ContactRegisterCubit>().save(
                            ContactModel(
                              name: _nameEC.text,
                              email: _emailEC.text,
                            ),
                          );
                    }
                  },
                  child: const Text(
                    "Salvar",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
