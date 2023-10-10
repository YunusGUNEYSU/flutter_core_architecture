import 'package:flutter/material.dart';
import 'package:flutter_core/core/utils/responsive_settings.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Design',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Responsive Design',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.red.shade300),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Container(
            //! calculates as a percentage
            height: 50.h,
            width: 50.w,
            color: Colors.red.shade300,
          ),
        ),
      ),
    );
  }
}
