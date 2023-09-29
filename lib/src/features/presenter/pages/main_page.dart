import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_time/src/core/arguments/pokemon_argument/pokemon_argument.dart';
import 'package:study_time/src/features/presenter/pages/pokemons_page.dart';
import 'package:study_time/src/features/presenter/pages/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Modular.get<FirebaseAuth>().authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data?.emailVerified == true) {
          return PokemonsPage(
            argument: PokemonArgument(uId: snapshot.data!.uid),
          );
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
