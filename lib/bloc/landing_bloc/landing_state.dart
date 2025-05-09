part of 'landing_bloc.dart';

abstract class LandingScreenState {}

class LandingScreenLoading extends LandingScreenState {}

class LandingScreenLoaded extends LandingScreenState {
  final List<PostModel> posts;
  final List<PostModel> allPosts;
  final Set<int> favorites;
  final bool searchByTitle;

  LandingScreenLoaded({
    required this.posts,
    required this.allPosts,
    required this.favorites,
    this.searchByTitle = true,
  });

  LandingScreenLoaded copyWith({
    List<PostModel>? posts,
    List<PostModel>? allPosts,
    Set<int>? favorites,
    bool? searchByTitle,
  }) {
    return LandingScreenLoaded(
      posts: posts ?? this.posts,
      allPosts: allPosts ?? this.allPosts,
      favorites: favorites ?? this.favorites,
      searchByTitle: searchByTitle ?? this.searchByTitle,
    );
  }
}

class LandingScreenError extends LandingScreenState {
  final String message;

  LandingScreenError(this.message);
}

class LandingScreenFavoritesState extends LandingScreenState {
  final Set<int> favorites;

  LandingScreenFavoritesState(this.favorites);
}
