part of 'exemple_bloc.dart';

abstract class ExampleState {}

class ExempleStateInitial extends ExampleState {}

class ExempleStateData extends ExampleState {
  final List<String> names;

  ExempleStateData({
    required this.names,
  });
}
