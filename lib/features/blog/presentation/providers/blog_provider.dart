

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hospital_riverpod/features/blog/domain/providers/bloglist_repository_provider.dart';
import 'package:hospital_riverpod/features/blog/presentation/providers/state/blog_notifire.dart';
import 'package:hospital_riverpod/features/blog/presentation/providers/state/blog_state.dart';

final blogListNotifierProvider = StateNotifierProvider<BlogNotifier, BlogState>((ref) {
  final repository = ref.watch(blogRepositoryProvider);
  return BlogNotifier(repository)..fetchBlogListData();
});

