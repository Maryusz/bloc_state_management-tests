import 'dart:math';

import 'package:bloc_prova_2/initial_page/bloc/initial_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InitialPageBloc, InitialPageState>(
              builder: (context, state) {
                if (state is InitialPageInitial) {
                  return Column(
                    children: [
                      const Text(
                        'Initial page initial',
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final String rUsername = Random().nextInt(100).toString();
                            final String rEmail = Random().nextInt(100).toString();
                            context.read<InitialPageBloc>().add(
                                  InitialPageInit(
                                    username: rUsername,
                                    email: rEmail,
                                  ),
                                );
                          },
                          child: const Text('Init')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/secondpage');
                          },
                          child: const Text('Go to second page'))
                    ],
                  );
                }
                if (state is InitialPageSuccess) {
                  return Column(
                    children: [
                      const Text(
                        'Initial page success',
                      ),
                      Text(
                        state.username,
                      ),
                      Text(
                        state.email,
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
                          child: const Text('Update')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/secondpage');
                          },
                          child: const Text('Go to second page'))
                    ],
                  );
                }

                if (state is InitialPageFailure) {
                  return Column(
                    children: [
                      const Text(
                        'Initial page failure',
                      ),
                      Text(
                        state.errorMessage,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/secondpage');
                          },
                          child: const Text('Go to second page'))
                    ],
                  );
                }

                if (state is InitialPageStateUpdated) {
                  return Column(
                    children: [
                      const Text(
                        'Initial page state updated',
                      ),
                      Text(
                        state.username,
                      ),
                      Text(
                        state.email,
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
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/secondpage');
                          },
                          child: const Text('Go to second page'))
                    ],
                  );
                }

                return const Text(
                  'Welcome',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
