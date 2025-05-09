import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_article_app/data/repository/landing_screen_repository.dart';
import 'package:flutter_article_app/data/model/post_model.dart';

part 'landing_state.dart';

class LandingScreenCubit extends HydratedCubit<LandingScreenState> {
  final LandingScreenRepository repository;
  List<PostModel> posts = [];
  Set<int> favorites = {};

  LandingScreenCubit(this.repository) : super(LandingScreenLoading());

  Future<void> loadPosts() async {
    emit(LandingScreenLoading());
    try {
      final posts = await repository.getPosts() ?? [];
      emit(LandingScreenLoaded(
        posts: posts,
        allPosts: posts,
        favorites: {},
      ));
    } catch (e) {
      final errorMessage = e.toString().replaceAll('ApiException: ', '');
      emit(LandingScreenError(errorMessage));
    }
  }

  void toggleFavorite(int index) {
    if (state is LandingScreenLoaded) {
      final currentState = state as LandingScreenLoaded;
      final newFavorites = Set<int>.from(currentState.favorites);
      if (newFavorites.contains(index)) {
        newFavorites.remove(index);
      } else {
        newFavorites.add(index);
      }
      emit(currentState.copyWith(favorites: newFavorites));
    }
  }

  void search(String query) {
    if (state is LandingScreenLoaded) {
      final current = state as LandingScreenLoaded;
      final filtered = current.allPosts.where((post) {
        final field = current.searchByTitle ? post.title : post.body;
        return field?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(current.copyWith(posts: filtered));
    }
  }

  void toggleSearchMode() {
    if (state is LandingScreenLoaded) {
      final current = state as LandingScreenLoaded;
      emit(current.copyWith(searchByTitle: !current.searchByTitle));
    }
  }

  @override
  LandingScreenState? fromJson(Map<String, dynamic> json) {
    try {
      final List<PostModel> posts =
          (json['posts'] as List).map((e) => PostModel.fromJson(e)).toList();
      final Set<int> favorites = Set<int>.from(json['favorites'] ?? []);
      return LandingScreenLoaded(
        posts: posts,
        favorites: favorites,
        allPosts: posts,
      );
    } catch (_) {
      return LandingScreenLoading();
    }
  }

  @override
  Map<String, dynamic> toJson(LandingScreenState state) {
    if (state is LandingScreenLoaded) {
      return {
        'posts': state.posts.map((e) => e.toJson()).toList(),
        'allPosts': state.posts.map((e) => e.toJson()).toList(),
        'favorites': state.favorites.toList(),
      };
    } else {
      return {};
    }
  }
}
