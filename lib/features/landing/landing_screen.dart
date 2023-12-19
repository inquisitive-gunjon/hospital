import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_riverpod/configs/app_configs.dart';
import 'package:hospital_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:hospital_riverpod/features/auth/presentation/providers/state/auth_state.dart';
import 'package:hospital_riverpod/routes/app_router.dart';
import 'package:hospital_riverpod/shared/data/local/shared_prefs_storage_service.dart';
import 'package:hospital_riverpod/shared/data/local/storage_service.dart';



@RoutePage()
class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends ConsumerState<LandingScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    ref.listen(authStateNotifierProvider.select((value) => value), ((previous, next) {
        //show Snackbar on failure
        if (next is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.exception.message.toString())));

        } else if (next is Success) {
          AutoRouter.of(context).pushAndPopUntil( LandingRoute(), predicate: (_) => false);
          // AutoRouter.of(context).pushAndPopUntil( LandingRoute(), predicate: (_) => false);
        }
      }),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        centerTitle: true,
        actions: [
        IconButton(
            onPressed: ()async{
              final result = ref.read(authStateNotifierProvider.notifier).logOutAdmin();
            },
            icon: Icon(Icons.login_outlined)
        )],
      ),
      body: Column(
        children: [
          Container(
            height: 150.h,
            width: double.infinity,
            color: Colors.cyan,
          ),
          Expanded(
              child: Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h // Adjust spacing between rows
                  ),
                  itemCount: blogFeatureModelList.length, // Replace this with the actual list length
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        AutoRouter.of(context).push( BlogListRoute());
                        // AutoRouter.of(context).push(route);
                      },
                      child: Container(
                        color: blogFeatureModelList[index].tileColor,
                        child: Center(child: Text(blogFeatureModelList[index].title.toString())),
                      ),
                    );
                  }
                ),
              )
          ),
        ],
      ),
    );
  }
}

class BlogFeatureModel{
  String? title;
  Color? tileColor;
  dynamic route;
  BlogFeatureModel({this.title,this.tileColor,this.route});
}

List<BlogFeatureModel> blogFeatureModelList=[
  BlogFeatureModel(
    title: "Blog List",
    tileColor: Colors.teal.shade100,
    route: BlogListRoute()
  ),
  BlogFeatureModel(
      title: "Blog Store",
      tileColor: Colors.teal,
      route: BlogStoreRoute()
  ),
  BlogFeatureModel(
      title: "Blog Update",
      tileColor: Colors.teal.shade200,
      route: BlogUpdateRoute()
  ),
  BlogFeatureModel(
      title: "Blog Delete",
      tileColor: Colors.teal.shade50,
      route: BlogDeleteRoute()
  ),
];

