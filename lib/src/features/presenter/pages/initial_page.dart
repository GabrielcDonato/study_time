import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import 'package:study_time/src/features/presenter/cubits/user/user_cubit.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late final UserCubit _userCubit;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
          ),
          BlocBuilder<UserCubit, UserState>(
            bloc: _userCubit,
            builder: (context, state) {
              if (state is UserLoading) {
                return const CircularProgressIndicator();
              }
              if (state is UserError) {
                return const Text('deu erro kkkk');
              }
              if (state is UserSuccess) {
                return Text(
                  'Uid:${state.user.uid}, Email:${state.user.email}',
                );
              }

              return ElevatedButton(
                onPressed: () {
                  _userCubit.registerUser(
                    user: UserEntity(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                },
                child: const Text(
                  'Cadastre-se',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
