import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ttoss/common/common.dart';
import 'package:flutter_ttoss/common/widget/w_arrow.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;

  const AnimatedAppBar(this.title, {super.key, required this.scrollController, required this.animationController});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  Duration get duration => 10.ms;
  double scrollPosition = 0;
  late CurvedAnimation animation = CurvedAnimation(
      parent: widget.animationController, curve: Curves.bounceInOut);

  //ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);

  @override
  void initState() {
    widget.animationController.addListener(() {
      setState(() {});
    });

    widget.scrollController.addListener(() {
      setState(() {
        scrollPosition = widget.scrollController.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80;

  double getValue(double initial, double target) {
    if (isTriggered) {
      return target;
    }
    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: Stack(
        children: [
          Tap(
              onTap: () {
                Nav.pop(context);
              },
              child: const Arrow(
                direction: AxisDirection.left,
              )).p20(),
          AnimatedContainer(
            duration: duration,
            padding:
                EdgeInsets.only(left: getValue(20, 50), top: getValue(50, 15)),
            child: AnimatedDefaultTextStyle(
              duration: duration,
              style: TextStyle(
                  fontSize: getValue(30, 18), fontWeight: FontWeight.bold),
              child: widget.title.text.make(),
            ),
          ),
          Positioned(
            right: -animation.value * -178,
            child: TweenAnimationBuilder<Color?>(
              duration: 1000.ms,
              tween: ColorTween(
                  begin: Colors.green,
                  end: isTriggered ? Colors.orange : Colors.green),
              builder: (context, value, child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      value ?? Colors.green, BlendMode.modulate),
                  child: child),
              child: Image.asset(
                "$basePath/icon/map_point.png",
                height: 54,
                // color: value,
                // colorBlendMode: BlendMode.modulate,
              ),
            ),
          )
        ],
      ),
    );
  }
}
