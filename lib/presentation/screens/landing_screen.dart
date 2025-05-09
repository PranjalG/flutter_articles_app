import 'package:flutter/material.dart';
import 'package:flutter_article_app/data/data_provider/landing_screen_data_provider.dart';
import 'package:flutter_article_app/data/model/post_model.dart';
import 'package:flutter_article_app/data/repository/landing_screen_repository.dart';
import 'package:flutter_article_app/presentation/widgets/custom_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isLoading = true;
  bool showGoToTopButton = false;
  late ScrollController _scrollController;
  LandingScreenRepository postsRepo =
  LandingScreenRepository(LandingScreenDataProvider());

  List<PostModel>? postsData = [];

  Future<void> fillData() async {
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
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    fillData();
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 300 && !showGoToTopButton) {
      setState(() {
        showGoToTopButton = true;
      });
    } else if (_scrollController.offset < 300 && showGoToTopButton) {
      setState(() {
        showGoToTopButton = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: isLoading
          ? ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      )
          : RefreshIndicator(
        onRefresh: fillData,
        child: ListView.builder(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: postsData?.length,
          itemBuilder: (context, index) {
            final post = postsData?[index];
            return CustomCard(
              title: post?.title ?? '',
              subtitle: post?.body ?? '',
            );
          },
        ),
      ),
      floatingActionButton: showGoToTopButton
          ? FloatingActionButton(
        onPressed: _scrollToTop,
        backgroundColor: Colors.yellow[200],
        child: const Icon(Icons.arrow_upward),
      )
          : null,
    );
  }
}
