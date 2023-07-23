import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App404 extends StatelessWidget {
  const App404({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
            child: Text(
      'Sorry page not found 404',
      style: TextStyle(
        fontSize: 45.sp,
      ),
    )));
  }
}
