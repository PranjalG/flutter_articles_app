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
    try {
      final fetchedPosts = await repository.getPosts();
      posts = fetchedPosts!;
      emit(LandingScreenLoaded(posts, favorites));
    } catch (e) {
      emit(LandingScreenError("Failed to load posts"));
    }
  }

  void toggleFavorite(int postId) {
    if (favorites.contains(postId)) {
      favorites.remove(postId);
    } else {
      favorites.add(postId);
    }
    emit(LandingScreenLoaded(posts, favorites));
  }

  bool isFavorite(int postId) {
    return favorites.contains(postId);
  }

  @override
  LandingScreenState? fromJson(Map<String, dynamic> json) {
    try {
      final List<PostModel> posts =
          (json['posts'] as List).map((e) => PostModel.fromJson(e)).toList();
      final Set<int> favorites = Set<int>.from(json['favorites'] ?? []);
      return LandingScreenLoaded(posts, favorites);
    } catch (_) {
      return LandingScreenLoading();
    }
  }

  @override
  Map<String, dynamic> toJson(LandingScreenState state) {
    if (state is LandingScreenLoaded) {
      return {
        'posts': state.posts.map((e) => e.toJson()).toList(),
        'favorites': state.favorites.toList(),
      };
    } else {
      return {};
    }
  }
}
