


import 'package:auto_route/auto_route.dart';
import 'package:hospital_riverpod/routes/app_router.dart';
import 'package:hospital_riverpod/shared/data/local/storage_service.dart';
// import 'package:hospital_riverpod/shared/domain/provider/sharedpreferences_storage_service_provider.dart';
import 'package:hospital_riverpod/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/auth_provider.dart';
import '../providers/state/auth_state.dart';
import '../widgets/custom_textform_filed.dart';
import '../widgets/textformfiled_validator.dart';


@RoutePage()

class LogInScreen extends ConsumerStatefulWidget{

  final Function(bool?) ? onResult;
  const LogInScreen({Key? key,this.onResult}) : super(key: key);

  @override
  ConsumerState<LogInScreen> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<LogInScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passWordTextEditingController = TextEditingController();
  bool isChecked = false;



  @override
  void dispose(){
    phoneTextEditingController.dispose();
    passWordTextEditingController.dispose();
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {


    final authProvider = ref.watch(authStateNotifierProvider);

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




    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xff069DD8);
      }
      return Color(0xff565656);
    }



    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:  const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login_backend.png"),
              fit: BoxFit.cover),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 133.h),
              Image.asset('assets/images/img.png',width: 176.w,height: 40.h,),


              ///...............................................login container...........................................

              Padding(
                padding: EdgeInsets.only(left: 12.w,right: 12.w,top:24.h ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    boxShadow:[
                      BoxShadow(
                        color: Color(0xff000000).withOpacity(0.12),
                        spreadRadius: 2,
                        blurRadius: 18,
                        offset: Offset(0, 3),
                      ),
                    ] ,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(top: 16.0.h,left:12.w,right: 12.w ,bottom: 16.h),
                    child: Column(
                      children: [
                        Text('Sign In', style: TextStyle(color: AppColors.lightGrey),),
                        SizedBox(height: 6.h,),
                        Text('Welcome to seller login ', style: TextStyle(fontSize:16.sp,color:AppColors.black,fontWeight:FontWeight.w500),),
                        SizedBox(height: 12.h,),
                        const Divider(height: 1,color: AppColors.white,),
                        SizedBox(height: 22.h,),

                        ///..............................Textform filed for Mobile and password.................

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///.........................phone number textform filed.....................
                                Text('Mobile', style: TextStyle(fontSize:14.sp,color:AppColors.black,fontWeight:FontWeight.w500),),
                                SizedBox(height: 8.h,),

                                CustomTextFormFiled(
                                  textEditingController: phoneTextEditingController,
                                  hinText: 'Enter mobile number',
                                  keyboardType: TextInputType.number,
                                  textFormFiledValidator: (value ) {
                                    if (value == null || value.isEmpty) {
                                      return TextformFiledValidator.validatePhone(phoneTextEditingController.text);
                                      // return 'This filed must not be empty';
                                    }
                                    return TextformFiledValidator.validatePhone(value);
                                    //return null;
                                  },

                                  onChanged: (value) {
                                    // Perform live validation here using the provided validation function
                                    setState(() {
                                      _formKey.currentState!.validate();
                                    });


                                  },
                                ),


                                ///...........................password textformfiled...........................
                                SizedBox(height: 20.h,),
                                Text('Password', style: TextStyle(fontSize:14.sp,color:AppColors.black,fontWeight:FontWeight.w500),),
                                SizedBox(height: 8.h,),
                                CustomTextFormFiled(
                                  textEditingController: passWordTextEditingController,
                                  hinText: 'Enter your password',
                                  keyboardType: TextInputType.text,
                                  textFormFiledValidator: (value ) {
                                    if (value == null || value.isEmpty) {
                                      return TextformFiledValidator.validatePassword2(passWordTextEditingController.text);
                                      // return 'This filed must not be empty';
                                    }
                                    return TextformFiledValidator.validatePassword2(value);
                                    // return null;
                                  },
                                  onChanged: (String ) {
                                    _formKey.currentState!.validate();
                                  },
                                ),
                                SizedBox(height: 10.h,),




                                ///...................................checkbox............................................

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 24.w,
                                      height: 24.h,
                                      child: Checkbox(side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                                        if (states.contains(MaterialState.selected)) {
                                          return  BorderSide(width: 2, color: Color(0xff565656));
                                        }
                                        return  BorderSide(width: 1, color: Color(0xff565656));
                                      },
                                      ),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
                                        checkColor: Colors.white,
                                        fillColor: MaterialStateProperty.resolveWith(getColor),
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          }
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10.w,),
                                    Text('Remember Me',style:TextStyle(fontSize:14.sp,color:AppColors.black,fontWeight:FontWeight.w500),),
                                    const Spacer(),
                                    TextButton(
                                        onPressed: (){},
                                        child: Text('Forgot password ?',style:TextStyle(fontSize:14.sp,color:AppColors.black,fontWeight:FontWeight.w500),)),
                                  ],
                                ),
                                SizedBox(height: 36.h,),




                                ///...............Sign in Button........................................

                                authProvider.maybeMap(
                                  loading: (_) => const Center(child: CircularProgressIndicator(color: AppColors.primary,)),
                                  orElse: () => loginButton(ref),
                                ),


                                // AppCustomButton(
                                //     height: 48.h,
                                //     width: double.infinity,
                                //     fontWeight: FontWeight.w700,
                                //     fontSize: 14.sp,
                                //     title: 'Sign In',
                                //     onPressed: () async {
                                //
                                //       loginProvider.maybeMap(
                                //         loading: (_) => const Center(child: CircularProgressIndicator()),
                                //         orElse: () {
                                //           if(_formKey.currentState!.validate()){
                                //             ref.read(sellerauthStateNotifierProvider.notifier).loginUser(
                                //               phoneTextEditingController.text.trim(),
                                //               passWordTextEditingController.text.trim(),
                                //             );
                                //             // ).then((value) => AutoRouter.of(context).pushAndPopUntil( DashboardRoute(), predicate: (_) => false));
                                //
                                //             // ScaffoldMessenger.of(context).showSnackBar(
                                //             //   SnackBar(content: Text('Processing Data')),
                                //             // );
                                //             //Navigator.pushNamed(context, LandingPage.routeName);
                                //
                                //             //AutoRouter.of(context).pushAndPopUntil( LandingRoute(), predicate: (_) => false);
                                //
                                //
                                //           }
                                //
                                //         },
                                //       );
                                //
                                //     })

                                // AppCustomButton(
                                //   height: 48.h,
                                //   width: double.infinity,
                                //   fontWeight: FontWeight.w700,
                                //   fontSize: 14.sp,
                                //   title: 'Sign In',
                                //   onPressed: () async {
                                //     loginProvider.maybeMap(
                                //       loading: (_) => const Center(child: CircularProgressIndicator()),
                                //       orElse: () async {
                                //         if (_formKey.currentState!.validate()) {
                                //           final result = await ref.read(sellerauthStateNotifierProvider.notifier).loginUser(
                                //             phoneTextEditingController.text.trim(),
                                //             passWordTextEditingController.text.trim(),
                                //           );
                                //           SharedPreferences pref = await SharedPreferences.getInstance();
                                //           pref.setBool('logged_in', true);
                                //           //widget.onResult.call(true);
                                //         }
                                //       },
                                //     );
                                //   },
                                // )

                              ],
                            ),
                          ),
                        ),



                        ///.............sign up text  button...............................
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Become a seller',style:TextStyle(fontSize:14.sp,color:AppColors.black,fontWeight:FontWeight.w500),),

                            TextButton(
                                onPressed: (){
                                  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  //     SignUpPage()), (Route<dynamic> route) => false);
                                },
                                child: Text('Sign Up',style: TextStyle(fontSize: 14.sp,fontWeight:FontWeight.w700,color: const Color(0xFF0000FF,),
                                  decoration: TextDecoration.underline,

                                ),)),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }




  ///--------------------------------------------loginButton-------------------------------------------------
  Widget loginButton(WidgetRef ref) {
    return GestureDetector(
      onTap:  ()async{
          // validate email and password
          if(_formKey.currentState!.validate()){
            final result = ref.read(authStateNotifierProvider.notifier).adminLogin(
              phoneTextEditingController.text.trim(),
              passWordTextEditingController.text.trim(),
            );
          }
        },
      child: Container(
        color: Colors.amber,
          height: 48.h,
          width: double.infinity,
        child: Center(child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp,color: Colors.black),)),
      ),
    );
  }







}