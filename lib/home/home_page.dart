import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ButtonCard(
                onPressed: () {
                  Navigator.of(context).pushNamed('/bloc/exemple/');
                },
                child: const Text('Exemple'),
              ),
              const SizedBox(height: 10),
              _ButtonCard(
                onPressed: () {},
                child: const Text('Exemple Freezed'),
              ),
              const SizedBox(height: 10),
              _ButtonCard(
                onPressed: () {},
                child: const Text('Contact'),
              ),
              const SizedBox(height: 10),
              _ButtonCard(
                onPressed: () {},
                child: const Text('Contact Cubit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonCard extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  const _ButtonCard({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
