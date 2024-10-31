import 'package:flutter/material.dart';
import 'package:talabat_pos/screens/left_home.dart';
import 'package:talabat_pos/screens/right_home.dart';
import 'package:talabat_pos/utils/color.dart';
import 'package:talabat_pos/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      body: Row(
        children: [
          const Expanded(flex: 7, child: LeftHome()),
          if (!(AppDimension(context).width < 800))
            const Expanded(flex: 3, child: RightHome()),
        ],
      ),
    );
  }
}
