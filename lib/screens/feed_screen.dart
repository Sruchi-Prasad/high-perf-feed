import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/feed_provider.dart';
import '../widgets/post_card.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() => ref.read(feedProvider.notifier).fetchPosts());

    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 200) {
        ref.read(feedProvider.notifier).fetchPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(feedProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Feed")),
      body: ListView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts[index]);
        },
      ),
    );
  }
}
