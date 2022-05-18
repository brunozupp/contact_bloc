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
      body: BlocBuilder<ExampleBloc,ExampleState>(
        builder: (context, state) {

          if(state is ExampleStateData) {
            return ListView.builder(
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
    );
  }
}