import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:study_time/src/core/routes/app_named_routes.dart';
import 'package:study_time/src/core/widgets/primary_button_state.dart';
import 'package:study_time/src/core/widgets/primary_button_widget.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import 'package:study_time/src/features/presenter/cubits/user/user_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final UserCubit _userCubit;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _userCubit = context.read<UserCubit>();
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
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UserError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              bloc: _userCubit,
              builder: (context, state) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: GeneralButtonWidget(
                    isLoading: state is UserLoading,
                    onPressed: () {
                      _userCubit.login(
                        user: UserEntity(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                    title: 'Logar',
                  ),
                );
              },
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: GeneralButtonWidget(
                state: ButtonState.secondary,
                onPressed: () => Modular.to.navigate(
                  AppNamedRoutes.registerPage,
                ),
                title: 'Registrar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
