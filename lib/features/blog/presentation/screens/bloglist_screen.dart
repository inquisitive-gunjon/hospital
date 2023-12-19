import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_riverpod/features/blog/presentation/providers/blog_provider.dart';
import 'package:hospital_riverpod/features/blog/presentation/providers/state/blog_state.dart';
import 'package:hospital_riverpod/shared/theme/app_colors.dart';



@RoutePage()
class BlogListScreen extends ConsumerStatefulWidget {
  const BlogListScreen({super.key});

  @override
  ConsumerState<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends ConsumerState<BlogListScreen> {

  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(blogListNotifierProvider.notifier);
      notifier.fetchBlogListData();
    }
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final allOrderInformationState = ref.watch(blogListNotifierProvider);
    final notifierState = ref.read(blogListNotifierProvider.notifier);

    ref.listen(
      blogListNotifierProvider.select((value) => value),
      ((BlogState? previous, BlogState next) {
        //show Snackbar on failure
        if (next.state == BlogConcreteState.fetchProductDetails) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }
      }),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Blog List"),centerTitle: true,backgroundColor: AppColors.primary,),
      body: Column(
        children: [
          notifierState.state.isinitial == false &&  notifierState.state.isLoading == false?
              Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notifierState.state.blogDataList!.length,
                    itemBuilder: (context,index){
                      return Container(
                        height: 100.h,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(notifierState.state.blogDataList![index].title)
                          ],
                        ),
                      );
                    },
                  ),
              ):Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
