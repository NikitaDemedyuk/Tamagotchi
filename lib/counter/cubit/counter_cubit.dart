import 'dart:html';

import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<bool> {
  /// {@macro counter_cubit}
  CounterCubit() : super(false);

  /// Add 1 to the current state.
  void increment() => emit(true);

  /// Subtract 1 from the current state.
  void decrement() => emit(false);
}