import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFreezedExamplePage extends StatelessWidget {

  const BlocFreezedExamplePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Freezed'),),
      body: BlocListener<ExampleFreezedBloc,ExampleFreezedState>(
        listener: (context, state) {
          state.mapOrNull(
            showBanner: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(value.message)),
              );
            }
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              BlocSelector<ExampleFreezedBloc, ExampleFreezedState, bool>(
                selector: (state) => state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ), 
                builder: (_,showLoader) {
                  if(showLoader) {
                    return const LinearProgressIndicator();
                  }

                  return const SizedBox.shrink();
                }
              ),

              BlocSelector<ExampleFreezedBloc, ExampleFreezedState, List<String>>(
                selector: (state) {
                  return state.maybeWhen(
                    data: (names) => names,
                    showBanner: (message, names) => names,
                    orElse: () => <String>[],
                  );
                }, 
                builder: (context, names) {
                  print("Buildando LISTAAAA -> ${DateTime.now()}");
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: names.length,
                    itemBuilder: (_, index) {
                      final name = names[index];

                      return ListTile(
                        title: Text(
                          name
                        ),
                      );
                    }
                  );
                }
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocSelector<ExampleFreezedBloc,ExampleFreezedState,bool>(
        selector: (state) {
          return state.maybeWhen(
            orElse: () => true,
            loading: () => false,
          );
        }, 
        builder: (context, showButton) {
          if(showButton) {
            return FloatingActionButton(
              child: const Icon(
                Icons.add,
              ),
              onPressed: () async {

                final formKey = GlobalKey<FormState>();
                final nameEC = TextEditingController();

                await showDialog<String?>(
                  context: context, 
                  builder: (_) {
                    return AlertDialog(
                      title: const Text("Digite um nome"),
                      content: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: nameEC,
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return "Nome obrigatório";
                                }

                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Nome",
                              )
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            ElevatedButton(
                              onPressed: () {
                                
                                final formValid = formKey.currentState?.validate() ?? false;

                                if(formValid) {
                                  context.read<ExampleFreezedBloc>().add(
                                    ExampleFreezedEvent.addName(
                                      nameEC.text,
                                    ),
                                  );

                                  Navigator.of(context).pop();
                                }
                              }, 
                              child: const Text("Enviar"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
              },
            );
          }

          return const SizedBox.shrink();
        }
      ),
    );
  }
}