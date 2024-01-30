import 'package:contact_bloc/features/bloc_example/bloc/exemple_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_exemple.dart';
import 'package:contact_bloc/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routes: {
        '/home': (_) => const HomePage(),
        '/bloc/exemple/': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocExemple(),
            ),
      },
      home: const HomePage(),
    );
  }
}
