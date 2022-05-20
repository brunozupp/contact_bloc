import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
    
class BlocExamplePage extends StatelessWidget {

  const BlocExamplePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      body: BlocListener<ExampleBloc,ExampleState>( // Esse cara não rebuilda a minha tela, ele apenas escuta mudanças e executa a função passada em "listener:"
        listenWhen: (previous, current) { // Só vai executar o listener se essa condição for verdadeira
          return previous is ExampleStateInitial && current is ExampleStateData && current.names.isNotEmpty;
        },
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Estado alterado = ${state.runtimeType}"),
            ),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Esse cara é uma junção do BlocBuilder com o BlocListener
              BlocConsumer<ExampleBloc,ExampleState>(
                // buildWhen e listenWhen só executa cada par quando forem verdadeiros
                buildWhen: (previous, current) => true,
                listenWhen: (previous, current) => true,
                builder: (context, state) {
                  if(state is ExampleStateData) {
                    return Text("Total de nomes é ${state.names.length}");
                  }

                  return Text("É um ${state.runtimeType}");
                }, 
                listener: (context, state) {
                  print("Estado alterado = ${state.runtimeType}");
                }, 
              ),

              // Quando quero apenas uma parte do meu estado
              // Ele vai ser invocado toda vez que um estado for alterado. Mas tem a seguinte caracteristica:
              // Ele sempre vai tentar selecionar o valor e já entregar pro builder um valor sem eu precisar manipular o mesmo
              BlocSelector<ExampleBloc,ExampleState,bool>(
                selector: (state) {
                  return state is ExampleStateInitial;
                }, 
                builder: (context, showLoader) {
                  if(showLoader) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return const SizedBox.shrink();
                }
              ),

              BlocSelector<ExampleBloc,ExampleState,List<String>>(
                selector: (state) {
                  if(state is ExampleStateData) {
                    return state.names;
                  }

                  return [];
                },
                builder: (context, names) {

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: names.length,
                    itemBuilder: (_,index) {
                      final name = names[index];

                      return ListTile(
                        title: Text(
                          name
                        ),
                        onTap: () {
                          context.read<ExampleBloc>().add(
                            ExampleRemoveNameEvent(name: name),
                          );
                        },
                      );
                    }
                  );

                }
              ),

              const Divider(),

              BlocBuilder<ExampleBloc,ExampleState>(
                builder: (context, state) {

                  if(state is ExampleStateData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.names.length,
                      itemBuilder: (_,index) {
                        final name = state.names[index];

                        return ListTile(
                          title: Text(
                            name
                          ),
                        );
                      }
                    );
                  }

                  return const SizedBox.shrink();

                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}