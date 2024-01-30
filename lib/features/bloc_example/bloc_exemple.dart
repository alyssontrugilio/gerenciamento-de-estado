import 'dart:developer';

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
        body: BlocListener<ExampleBloc, ExampleState>(
          listener: (context, state) {
            if (state is ExampleStateData) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('Foram encontrado ${state.names.length} nomes')),
              );
            }
          },
          child: Column(
            children: [
              BlocConsumer<ExampleBloc, ExampleState>(
                builder: (_, state) {
                  if (state is ExampleStateData) {
                    return Text('Total de nomes é ${state.names.length}');
                  }
                  return const SizedBox.shrink();
                },
                listener: (context, state) {
                  log('Estado alterado para ${state.runtimeType}');
                },
              ),
              BlocSelector<ExampleBloc, ExampleState, bool>(
                selector: (state) {
                  return state is ExampleStateInitial;
                },
                builder: (context, showLoader) {
                  if (showLoader) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                  return SizedBox.shrink();
                },
              ),
              BlocBuilder<ExampleBloc, ExampleState>(
                builder: (context, state) {
                  if (state is ExampleStateData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.names.length,
                      itemBuilder: (context, index) {
                        final name = state.names[index];
                        return ListTile(
                          onTap: () {
                            context
                                .read<ExampleBloc>()
                                .add(ExampleRemoveNameEvent(name: name));
                          },
                          title: Text(state.names[index]),
                        );
                      },
                    );
                  }
                  if (state is ExampleStateInitial) {
                    return const Center(
                      child: Text('Nada encontrado'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
