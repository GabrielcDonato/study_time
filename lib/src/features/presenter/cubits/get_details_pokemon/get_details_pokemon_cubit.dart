import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/details_pokemon_entity.dart';
import 'package:study_time/src/features/domain/usecases/get_details_pokemon/get_details_pokemon_usecase.dart';

part 'get_details_pokemon_state.dart';

class GetDetailsPokemonCubit extends Cubit<GetDetailsPokemonState> {
  final GetDetailsPokemonUsecase _getDetailsPokemonUsecase;
  GetDetailsPokemonCubit(
      {required GetDetailsPokemonUsecase getDetailsPokemonUsecase})
      : _getDetailsPokemonUsecase = getDetailsPokemonUsecase,
        super(const GetDetailsPokemonInitial());

  Future<void> getPokemonDetails({required int pokemonId}) async {
    emit(const GetDetailsPokemonLoading());

    final result = await _getDetailsPokemonUsecase(pokemonId: pokemonId);

    result.fold(
      (failure) {
        emit(
          const GetDetailsPokemonError(),
        );
      },
      (responseDetailsPokemonEntity) {
        emit(
          GetDetailsPokemonSuccess(
            detailsPokemon: responseDetailsPokemonEntity,
          ),
        );
      },
    );
  }
}
