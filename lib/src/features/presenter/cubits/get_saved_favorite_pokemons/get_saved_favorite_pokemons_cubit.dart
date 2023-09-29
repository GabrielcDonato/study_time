import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/get_saved_favorite_pokemons_entity.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase.dart';

part 'get_saved_favorite_pokemons_state.dart';

class GetSavedFavoritePokemonsCubit
    extends Cubit<GetSavedFavoritePokemonsState> {
  final GetSavedFavoritePokemonsUsecase _getSavedFavoritePokemonsUsecase;

  GetSavedFavoritePokemonsCubit(
      {required GetSavedFavoritePokemonsUsecase
          getSavedFavoritePokemonsUsecase})
      : _getSavedFavoritePokemonsUsecase = getSavedFavoritePokemonsUsecase,
        super(
          const GetSavedFavoritePokemonsInitial(),
        );

  void getFavorites({required String userId}) async {
    final result = await _getSavedFavoritePokemonsUsecase(userId: userId);
    emit(
      const GetSavedFavoritePokemonsLoading(),
    );
    result.fold(
      (l) => emit(
        const GetSavedFavoritePokemonsError(),
      ),
      (getSavedFavoritePokemonsEntity) => emit(
        GetSavedFavoritePokemonsSuccess(
            getSavedFavoritePokemonsEntity: getSavedFavoritePokemonsEntity),
      ),
    );
  }
}
