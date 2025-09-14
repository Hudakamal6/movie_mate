import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mate_app/core/constants/constants.dart';
import 'package:movie_mate_app/features/favourites/presentation/manager/favorites_cubit.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    print("int state ");
    context
        .read<FavoritesCubit>()
        .getFavorites();

    super.initState();
  }

 @override
  void didUpdateWidget(covariant FavouriteScreen oldWidget) {
   print("did");
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Favourites ❤️"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavoritesError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is FavoritesLoaded) {
            final movies = state.favorites;

            if (movies.isEmpty) {
              return const Center(
                child: Text(
                  "No favourites yet 😔",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                print("Building ${movie.movieTitle}, bytes: ${movie.movieImage?.lengthInBytes}");


                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Poster
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: movie.movieImage == null
                            ? Container(
                                width: 100,
                                height: 140,
                                color: Colors.grey.shade800,
                                child: const Icon(Icons.broken_image,
                                    color: Colors.white54, size: 40),
                              )
                            : Image.memory(
                          movie.movieImage!,
                                width: 100,
                                height: 140,
                                fit: BoxFit.cover,
                                errorBuilder: (context, _, __) => Container(
                                  width: 100,
                                  height: 140,
                                  color: Colors.grey.shade800,
                                  child: const Icon(Icons.broken_image,
                                      color: Colors.white54, size: 40),
                                ),
                              ),
                      ),

                      // Details
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.movieTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Released: ${movie.movieReleaseDate}",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${movie.movieRate.toStringAsFixed(1)} / 10",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<FavoritesCubit>()
                                          .removeFromFavorites(movie.movieId);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
