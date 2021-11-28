import 'package:flutter/material.dart';
import 'package:fuse/util/ui/images_ui.dart';

class MySlideTransition extends StatefulWidget {
  final Offset begin;
  final Offset end;
  final String image;
  final Duration? duration;
  const MySlideTransition({Key? key,required this.begin,required this.end,required this.image, this.duration}) : super(key: key);

  @override
  State<MySlideTransition> createState() => _MySlideTransitionState();
}

class _MySlideTransitionState extends State<MySlideTransition> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration ??  const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin:widget.begin,
    end: widget.end,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child:  MyImages(image: widget.image),
    );
  }
}
