

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormFiled extends StatelessWidget {

  String hinText;
  TextInputType keyboardType;
  TextEditingController textEditingController;
  int? maxLine;
  String? Function(String?) textFormFiledValidator;
  void Function(String) onChanged;




  CustomTextFormFiled({
    Key? key,
    required this.hinText,
    required this.keyboardType,
    required this.textEditingController,
    required this.textFormFiledValidator,
    this.maxLine,
    required this.onChanged,

  }) : super(key: key);





  @override
  Widget build(BuildContext context) {

    return TextFormField(

        controller: textEditingController,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        validator: textFormFiledValidator,
        onChanged: onChanged,

        style: TextStyle(fontSize: 13.sp,fontWeight:FontWeight.w400 ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12),
            ///........................enable border..............................
            enabledBorder: OutlineInputBorder(
              borderSide:BorderSide(color: Color(0xff069DD8),width: 2.w,),
              borderRadius: BorderRadius.circular(8.r),
            ),

            ///........................outLineInputBorder.........................
            errorBorder: OutlineInputBorder(
              borderSide:BorderSide(color: Color(0xff069DD8), width: 2.w,),
              borderRadius: BorderRadius.circular(8.r),
            ),


            ///........................error style................................
            errorStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.red),

            ///........................focuseBorder...............................
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xff069DD8),width: 2.w),
            ),


            border:OutlineInputBorder(
              borderSide:BorderSide(color: Color(0xff069DD8),width: 2.w,),
              borderRadius: BorderRadius.circular(8.r),),
            // InputBorder.none,
            fillColor: Color(0xffE0E0E0),

            filled: true,
            hintText: hinText,
            hintStyle: TextStyle(color: Color(0xff334257),fontSize: 14.sp,fontWeight: FontWeight.w400)
        ));





  }
}