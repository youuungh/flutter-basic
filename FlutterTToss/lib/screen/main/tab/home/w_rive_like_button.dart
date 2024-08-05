import 'package:flutter/material.dart';
import 'package:flutter_ttoss/common/common.dart';
import 'package:rive/rive.dart';

class RiveLikeButton extends StatefulWidget {
  final bool isLike;
  final void Function(bool isLike) onTapLike;

  const RiveLikeButton(this.isLike, {required this.onTapLike, super.key});

  @override
  State<RiveLikeButton> createState() => _RiveLikeButtonState();
}

class _RiveLikeButtonState extends State<RiveLikeButton> {
  late StateMachineController controller;
  late SMIBool smiPressed;
  late SMIBool smiHover;

  @override
  void didUpdateWidget(covariant RiveLikeButton oldWidget) {
    if (oldWidget.isLike != widget.isLike) {
      smiPressed.value = widget.isLike;
      smiHover.value = widget.isLike;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        widget.onTapLike(!widget.isLike);
      },
      child: RiveAnimation.asset(
        "$baseRivePath/light_like2.riv",
        stateMachines: ['State Machine 1'],
        onInit: (Artboard art) {
          controller = StateMachineController.fromArtboard(art, 'State Machine 1')!;
          controller.isActive = true;
          art.addController(controller);
          smiPressed = controller.findInput<bool>('Pressed') as SMIBool;
          smiHover = controller.findInput<bool>('Hover') as SMIBool;
        },
      ),
    );
  }
}

// class PlayPauseAnimation extends StatefulWidget {
//   const PlayPauseAnimation({super.key});
//
//   @override
//   State<PlayPauseAnimation> createState() => _PlayPauseAnimationState();
// }
//
// class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
//   late RiveAnimationController _controller;
//
//   void _togglePlay() => setState(() => _controller.isActive = !_controller.isActive);
//
//   bool get isPlaying => _controller.isActive;
//
//   @override
//   void initState() {
//     _controller = SimpleAnimation('idle');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: RiveAnimation.network(
//           'https://cdn.rive.app/animations/vehicles.riv',
//           controllers: [
//             _controller
//           ],
//           onInit: (_) => setState(() {}),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _togglePlay,
//         tooltip: isPlaying ? 'Pause' : 'Play',
//         child: Icon(
//           isPlaying ? Icons.pause : Icons.play_arrow
//         ),
//       ),
//     );
//   }
// }
