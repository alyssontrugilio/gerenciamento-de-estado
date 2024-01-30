import 'package:contact_bloc/features/bloc_example/bloc/exemple_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExemple extends StatelessWidget {
  const BlocExemple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Exemple'),
        ),
        body: BlocBuilder<ExampleBloc, ExampleState>(
          builder: (context, state) {
            if (state is ExempleStateData) {
              return ListView.builder(
                itemCount: state.names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.names[index]),
                  );
                },
              );
            }
            if (state is ExempleStateInitial) {
              return const Center(
                child: Text('Nada encontrado'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
