import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AnimationArea extends StatefulWidget {
  const AnimationArea({Key? key}) : super(key: key);

  @override
  State<AnimationArea> createState() => _AnimationAreaState();
}

class _AnimationAreaState extends State<AnimationArea> {
  bool topToCenter = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        topToCenter = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Colors.white,
      child: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            top: topToCenter ? 0.46.sh : -200,
            duration: const Duration(milliseconds: 400),
            child: Center(
              child: Text(
                "Logo",
                style: TextStyle(fontSize: 40.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
