import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

class Myblocs extends StatefulWidget {
  const Myblocs({Key? key}) : super(key: key);

  @override
  State<Myblocs> createState() => _MyblocsState();
}

class _MyblocsState extends State<Myblocs> {
  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    return Column(
      children: <Widget>[
        BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text('Counter: $state');
          },
        ),
        ElevatedButton(
          onPressed: () => counterCubit.increment(),
          child: Text('Increment'),
        ),
      ],
    );
  }
}
