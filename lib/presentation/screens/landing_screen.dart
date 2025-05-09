import 'package:flutter/material.dart';
import 'package:flutter_article_app/data/data_provider/landing_screen_data_provider.dart';
import 'package:flutter_article_app/data/model/post_model.dart';
import 'package:flutter_article_app/data/repository/landing_screen_repository.dart';
import 'package:flutter_article_app/presentation/widgets/custom_card.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isLoading = true;
  LandingScreenRepository postsRepo =
  LandingScreenRepository(LandingScreenDataProvider());

  List<PostModel>? postsData = [];

  void fillData() async {
    try {
      final fetchedPosts = await postsRepo.getPosts();
      setState(() {
        postsData = fetchedPosts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fillData(); // Call your async function here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: postsData?.length ?? 2,
        itemBuilder: (context, index) {
          final post = postsData?[index];
          return CustomCard(
            title: post?.title ?? '',
            subtitle: post?.body ?? '',
          );
        },
      ),
    );
  }
}