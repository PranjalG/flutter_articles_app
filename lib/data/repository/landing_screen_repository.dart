import 'package:flutter_article_app/data/data_provider/landing_screen_data_provider.dart';
import 'package:flutter_article_app/data/model/post_model.dart';

class LandingScreenRepository {
  final LandingScreenDataProvider landingScreenDataProvider;

  LandingScreenRepository(this.landingScreenDataProvider);

  Future<List<PostModel>?> getPosts() async {
    return await landingScreenDataProvider.fetchPosts();
  }
}
