import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_time/src/core/enum/type_search_enum.dart';
import 'package:study_time/src/features/domain/entities/get_all_pokemons/pokemon_entity.dart';
import 'package:study_time/src/features/domain/usecases/get_all_pokemons/get_all_pokemons_usecase.dart';

part 'get_all_pokemons_state.dart';

class GetAllPokemonsCubit extends Cubit<GetAllPokemonsState> {
  final GetAllPokemonsUsecase _getAllPokemonsUsecase;

  GetAllPokemonsCubit({required GetAllPokemonsUsecase getAllPokemonsUsecase})
      : _getAllPokemonsUsecase = getAllPokemonsUsecase,
        super(
          const GetAllPokemonsInitial(),
        );

  Future<void> getAllPokemons() async {
    emit(
      const GetAllPokemonsLoading(),
    );

    final result = await _getAllPokemonsUsecase();

    result.fold(
      (failure) {
        emit(
          const GetAllPokemonsError(),
        );
      },
      (responsePokemonsEntity) {
        emit(
          GetAllPokemonsSuccess(
            pokemons: responsePokemonsEntity,
          ),
        );
      },
    );
  }

  void filterPokemon({required String namePokemon}) {
    final currentState = (state as GetAllPokemonsSuccess);

    // final List<PokemonEntity> oldList = currentState.pokemons;

    // final List<PokemonEntity> pokemons = currentState.pokemons
    //     .where((pokemon) => pokemon.name.toLowerCase().contains(namePokemon))
    //     .toList();

    emit(
      currentState.copyWith(filter: namePokemon),
    );
  }
}
