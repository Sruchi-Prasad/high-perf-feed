class Post {
  final String id;
  final String thumbUrl;
  final String mobileUrl;
  final String rawUrl;
  final int likeCount;
  final bool isLiked;

  Post({
    required this.id,
    required this.thumbUrl,
    required this.mobileUrl,
    required this.rawUrl,
    required this.likeCount,
    this.isLiked = false,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      thumbUrl: json['media_thumb_url'],
      mobileUrl: json['media_mobile_url'],
      rawUrl: json['media_raw_url'],
      likeCount: json['like_count'] ?? 0,
    );
  }

  Post copyWith({
    int? likeCount,
    bool? isLiked,
  }) {
    return Post(
      id: id,
      thumbUrl: thumbUrl,
      mobileUrl: mobileUrl,
      rawUrl: rawUrl,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}