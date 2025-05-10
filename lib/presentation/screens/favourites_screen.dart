import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_article_app/bloc/landing_bloc/landing_bloc.dart';
import 'package:flutter_article_app/presentation/widgets/custom_card.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: GoogleFonts.aBeeZee(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.blue[800],
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.blue[50],
        centerTitle: true,
        elevation: 4,
      ),
      body: BlocBuilder<LandingScreenCubit, LandingScreenState>(
        builder: (context, state) {
          if (state is LandingScreenLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LandingScreenLoaded) {
            final favoritePosts =
                state.favorites.map((index) => state.posts[index]).toList();

            if (favoritePosts.isEmpty) {
              return const Center(
                child: Text("No favourite articles yet."),
              );
            }

            return ListView.builder(
              itemCount: favoritePosts.length,
              itemBuilder: (context, index) {
                final post = favoritePosts[index];
                const isFavorite = true;

                return CustomCard(
                  title: post.title ?? '',
                  subtitle: post.body ?? '',
                  isFavorite: isFavorite,
                  onFavoriteToggle: () {
                    final originalIndex = state.posts.indexOf(post);
                    context
                        .read<LandingScreenCubit>()
                        .toggleFavorite(originalIndex);
                  },
                );
              },
            );
          } else if (state is LandingScreenError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
