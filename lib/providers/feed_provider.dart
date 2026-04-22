import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/post.dart';

final Set<String> likingPosts = {};

final feedProvider = StateNotifierProvider<FeedNotifier, List<Post>>((ref) {
  return FeedNotifier();
});

class FeedNotifier extends StateNotifier<List<Post>> {
  FeedNotifier() : super([]);

  final supabase = Supabase.instance.client;
  int page = 0;
  bool isLoading = false;

  Future<void> fetchPosts() async {
    if (isLoading) return;
    isLoading = true;

    final response = await supabase
        .from('posts')
        .select()
        .order('created_at', ascending: false)
        .range(page * 10, (page + 1) * 10 - 1);

    final posts = (response as List)
        .map((e) => Post.fromJson(e))
        .toList();

    state = [...state, ...posts];
    page++;
    isLoading = false;
  }

  Future<void> toggleLike(Post post) async {
  final userId = "user_123";

  // 🔥 Spam protection (per post)
  if (likingPosts.contains(post.id)) return;
  likingPosts.add(post.id);

  final oldPost = post;

  // ✅ Optimistic update
  state = state.map((p) {
    if (p.id == post.id) {
      final liked = !p.isLiked;
      return p.copyWith(
        isLiked: liked,
        likeCount: liked ? p.likeCount + 1 : p.likeCount - 1,
      );
    }
    return p;
  }).toList();

  try {
    await supabase.rpc('toggle_like', params: {
      'p_post_id': post.id,
      'p_user_id': userId,
    });
  } catch (e) {
    // ❗ Revert UI
    state = state.map((p) {
      if (p.id == post.id) return oldPost;
      return p;
    }).toList();

    // ❗ Error handling
    print("Like failed: $e");
  }

  // ✅ Remove from loading set
  likingPosts.remove(post.id);
}
}