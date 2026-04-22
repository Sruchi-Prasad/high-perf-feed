import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/feed_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hshyeogqcumfrrpnvqlr.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhzaHllb2dxY3VtZnJycG52cWxyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY4Mjg3NDgsImV4cCI6MjA5MjQwNDc0OH0.955v4YsuFRYKgHmt9K--YOemHioG_DWzJE8siyRbsSI',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FeedScreen(),
    );
  }
}