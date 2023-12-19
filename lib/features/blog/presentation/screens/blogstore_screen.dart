import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



@RoutePage()
class BlogStoreScreen extends ConsumerStatefulWidget {
  const BlogStoreScreen({super.key});

  @override
  ConsumerState<BlogStoreScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends ConsumerState<BlogStoreScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
