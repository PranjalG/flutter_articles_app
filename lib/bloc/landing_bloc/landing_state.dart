part of 'landing_bloc.dart';

abstract class LandingScreenState {}

class LandingScreenLoading extends LandingScreenState {}

class LandingScreenLoaded extends LandingScreenState {
  final List<PostModel> posts;
  final Set<int> favorites;

  LandingScreenLoaded(this.posts, this.favorites);
}

class LandingScreenError extends LandingScreenState {
  final String message;

  LandingScreenError(this.message);
}

class LandingScreenFavoritesState extends LandingScreenState {
  final Set<int> favorites;

  LandingScreenFavoritesState(this.favorites);
}
