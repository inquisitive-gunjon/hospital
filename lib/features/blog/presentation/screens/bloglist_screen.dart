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

  initialLoadData()async{
    ref.read(blogNotifierProvider.notifier).fetchBlogListData();
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(blogNotifierProvider.notifier);
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
    final state = ref.watch(blogNotifierProvider);

    // final notifierState = ref.read(blogNotifierProvider.notifier);

    ref.listen(blogNotifierProvider.select((value) => value),
      ((BlogState? previous, BlogState next) {
        //show Snackbar on failure
        if (next.state == BlogConcreteState.fetchBlogDetails) {
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
          state.isinitial == false &&  state.isLoading == false?
              Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.blogDataList!.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100.h,
                          width: double.infinity,
                          color: Colors.amber,
                          child: Column(
                            children: [
                              Text(state.blogDataList![index].title),
                              Text(state.blogDataList![index].createdAt),
                              Text(state.blogDataList![index].date),
                              Text(state.blogDataList![index].description)
                            ],
                          ),
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
