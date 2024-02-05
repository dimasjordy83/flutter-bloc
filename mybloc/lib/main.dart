import 'package:flutter/material.dart';
import 'package:mybloc/materi/bloc.dart';
import 'package:mybloc/materi/provider.dart';
import 'package:mybloc/materi/statefull.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //     body: Center(
    //       // bloc
    //       child: BlocProvider(
    //         create: (context) => CounterCubit(),
    //         child: Myblocs(),
    //       ),

    //       // provider

    //       // body: ChangeNotifierProvider(
    //       //   create: (context) => Counter(),
    //       //   child: MyProvider(),
    //       // ),
    //     ),
    //   ),
    // );
    return MyCubit(title: 'cubit');
  }
}
