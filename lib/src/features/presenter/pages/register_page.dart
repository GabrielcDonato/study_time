import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/core/routes/export_routes.dart';
import 'package:study_time/src/core/widgets/primary_button_state.dart';
import 'package:study_time/src/core/widgets/primary_button_widget.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import 'package:study_time/src/features/presenter/cubits/user/user_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final UserCubit _userCubit;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _userCubit = Modular.get<UserCubit>();
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
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
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
              bloc: _userCubit,
              listener: (context, state) {
                if (state is UserError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                      ),
                    ),
                  );
                }
                if (state is UserSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppNamedRoutes.loginPage,
                    (route) => false,
                  );
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: GeneralButtonWidget(
                    isLoading: state is UserLoading,
                    state: ButtonState.secondary,
                    onPressed: () => _userCubit.registerUser(
                      user: UserEntity(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    ),
                    title: 'Cadastrar',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
