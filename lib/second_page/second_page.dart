import 'dart:math';

import 'package:bloc_prova_2/initial_page/bloc/initial_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<InitialPageBloc, InitialPageState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text(
                    'Second page',
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final String rUsername = Random().nextInt(100).toString();
                        final String rEmail = Random().nextInt(100).toString();
                        context.read<InitialPageBloc>().add(
                              UpdateInitialPageState(
                                username: rUsername,
                                email: rEmail,
                              ),
                            );
                      },
                      child: const Text('Update another time')),
                  BlocBuilder<InitialPageBloc, InitialPageState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            if (state is InitialPageStateUpdated) {
                              context.read<InitialPageBloc>().add(
                                    UpdateInitialPageState(
                                      username: state.username,
                                      email: state.email,
                                    ),
                                  );
                            }
                          },
                          child: const Text('Update with the same values'));
                    },
                  ),
                  BlocConsumer<InitialPageBloc, InitialPageState>(
                    listener: (context, state) {
                      if (state is InitialPageStateUpdated) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Username: ${state.username} - Email: ${state.email}',
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            final initialBloc = BlocProvider.of<InitialPageBloc>(context);

                            final String rEmail = Random().nextInt(100).toString();
                            if (state is InitialPageStateUpdated) {
                              initialBloc.add(
                                UpdateInitialPageState(
                                  username: state.username,
                                  email: rEmail,
                                ),
                              );
                            }
                          },
                          child: const Text('Update only one value'));
                    },
                  ),
                  Text(
                    state.props.toString(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
