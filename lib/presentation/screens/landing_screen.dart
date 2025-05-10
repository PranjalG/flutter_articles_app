import 'package:flutter/material.dart';
import 'package:flutter_article_app/bloc/landing_bloc/landing_bloc.dart';
import 'package:flutter_article_app/presentation/widgets/custom_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingScreenCubit, LandingScreenState>(
      listener: (context, state) {
        if (state is LandingScreenError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red[400],
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[50],
          elevation: 4,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/splash_book_icon.png",
                height: 36,
                width: 36,
              ),
              const SizedBox(width: 8),
              Text(
                "Welcome to Articles!",
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<LandingScreenCubit, LandingScreenState>(
          builder: (context, state) {
            if (state is LandingScreenLoading) {
              return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is LandingScreenLoaded) {
              final posts = state.posts;
              final favorites = state.favorites;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (query) => context
                                .read<LandingScreenCubit>()
                                .search(query),
                            decoration: InputDecoration(
                                hintText: state.searchByTitle
                                    ? 'Search by Title'
                                    : 'Search by Body',
                                hintStyle: GoogleFonts.aBeeZee(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[800],
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 22,
                                ),
                                contentPadding: EdgeInsets.zero),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.swap_horiz),
                          tooltip: 'Toggle Search Mode',
                          onPressed: () => context
                              .read<LandingScreenCubit>()
                              .toggleSearchMode(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<LandingScreenCubit>().loadPosts();
                      },
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          final isFavorite = favorites.contains(index);
                          return CustomCard(
                            title: post.title ?? '',
                            subtitle: post.body ?? '',
                            isFavorite: isFavorite,
                            onFavoriteToggle: () {
                              context
                                  .read<LandingScreenCubit>()
                                  .toggleFavorite(index);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is LandingScreenError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
        floatingActionButton:
            BlocBuilder<LandingScreenCubit, LandingScreenState>(
          builder: (context, state) {
            return state is LandingScreenLoaded && state.posts.isNotEmpty
                ? FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.yellow[200],
                    child: const Icon(Icons.arrow_upward),
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
