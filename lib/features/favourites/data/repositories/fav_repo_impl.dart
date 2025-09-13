import 'package:dartz/dartz.dart';
import 'package:movie_mate_app/features/favourites/data/models/movie_hive_model_extension.dart';
import '../../../../core/error/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/repositories/fav_repo.dart';
import '../data_sources/fav_local_data_source.dart';
import '../models/movie_hive_model.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesLocalDataSource localDataSource;

  FavoritesRepoImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> addToFavorites(MovieEntity movie) async {
    try {
      await localDataSource.addToFavorites(movie.toHiveModel());
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavorites(int movieId) async {
    try {
      await localDataSource.removeFromFavorites(movieId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getFavorites() async {
    try {
      final result = await localDataSource.getFavorites();
      return Right(result.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(int movieId) async {
    try {
      final result = await localDataSource.isFavorite(movieId);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure( e.toString()));
    }
  }
}
