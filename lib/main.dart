import 'package:bloc_prova_2/initial_page/bloc/initial_page_bloc.dart';
import 'package:bloc_prova_2/initial_page/initial_page.dart';
import 'package:bloc_prova_2/second_page/bloc/second_page_bloc.dart';
import 'package:bloc_prova_2/second_page/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => InitialPageBloc()),
    BlocProvider(create: (context) => SecondPageBloc()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const InitialPage(),
        '/secondpage': (context) => const SecondPage(),
      },
    );
  }
}
