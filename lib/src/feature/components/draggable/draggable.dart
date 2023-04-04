import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:password_manager/src/utils/extensions/context.dart';

import '../../../config/colors.dart';
import '../../../config/constants.dart';
import '../../../utils/haptics.dart';

class DraggableItemWidget extends StatefulWidget {
  const DraggableItemWidget(
      {Key? key,
        required this.child,
      })
      : super(key: key);

  final Widget child;

  @override
  State<DraggableItemWidget> createState() =>
      _DraggableItemWidgetState();
}

class _DraggableItemWidgetState extends State<DraggableItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  double _dragOffsetX = 0;

  bool hasHapticImpact = false;
  bool possibleRemoval = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        _dragOffsetX = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(Tween<double>(begin: _dragOffsetX, end: 0));
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var maxDistance = context.widthPx / 4;
    var trashHold = maxDistance;

    return GestureDetector(
        onPanDown: (details) {
          _controller.stop();
        },
        onPanUpdate: (details) {
          var moveX = details.delta.dx;
          if (_dragOffsetX >= 0 && moveX > 0 || _controller.isAnimating) {
            return;
          }
          if (_dragOffsetX.abs() >= trashHold) {
            if (!hasHapticImpact) {
              hasHapticImpact = true;
              AppHaptics.buttonPress();
            }
          }

          if (_dragOffsetX <= 0) {
            setState(() {
              if (_dragOffsetX.abs() > trashHold) {
                possibleRemoval = true;
              } else {
                possibleRemoval = false;
              }

              _dragOffsetX.abs() > maxDistance
                  ? _dragOffsetX += moveX / 2
                  : _dragOffsetX += moveX;
            });
          } else {
            setState(() {
              _dragOffsetX = 0;
            });
            return;
          }
        },
        onPanEnd: (details) {
          _runAnimation(details.velocity.pixelsPerSecond, size);

          if (possibleRemoval) {

            print("DELETE");
          }
          hasHapticImpact = false;
          possibleRemoval = false;
        },
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            AnimatedOpacity(
                opacity: possibleRemoval ? 1 : 0,
                duration: Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: AppColors.primaryColor,
                  ),
                  width: 30,
                  height: 30,
                  child: const Icon(
                    Icons.restore_from_trash,
                    size: 15,
                    color: Colors.black,
                  ),
                )),
            Transform.translate(
                offset: Offset(_dragOffsetX, 0), child: widget.child),
          ],
        ));
//    child: Align(alignment: _dragAlignment, child: widget.child));
  }
}
