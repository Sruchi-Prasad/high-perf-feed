import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/post.dart';

class DetailScreen extends StatefulWidget {
  final Post post;

  const DetailScreen({super.key, required this.post});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool loaded = false;

  @override
  void initState() {
    super.initState();

    // simulate loading full image
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: post.id,
            child: Stack(
              children: [
                // thumbnail
                CachedNetworkImage(
                  imageUrl: post.thumbUrl,
                  fit: BoxFit.cover,
                ),

                // full image fade in
                AnimatedOpacity(
                  opacity: loaded ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: CachedNetworkImage(
                    imageUrl: post.mobileUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              // simulate high-res download
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Downloading high-res...")),
              );
            },
            child: const Text("Download High-Res"),
          ),
        ],
      ),
    );
  }
}