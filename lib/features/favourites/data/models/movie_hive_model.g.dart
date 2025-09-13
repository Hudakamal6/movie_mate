// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieHiveModelAdapter extends TypeAdapter<MovieHiveModel> {
  @override
  final int typeId = 0;

  @override
  MovieHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieHiveModel(
      movieId: fields[0] as int,
      movieTitle: fields[1] as String,
      movieOverView: fields[2] as String,
      movieImage: fields[3] as String,
      movieReleaseDate: fields[4] as String,
      movieRate: fields[5] as double,
      movieVoteCount: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.movieId)
      ..writeByte(1)
      ..write(obj.movieTitle)
      ..writeByte(2)
      ..write(obj.movieOverView)
      ..writeByte(3)
      ..write(obj.movieImage)
      ..writeByte(4)
      ..write(obj.movieReleaseDate)
      ..writeByte(5)
      ..write(obj.movieRate)
      ..writeByte(6)
      ..write(obj.movieVoteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
