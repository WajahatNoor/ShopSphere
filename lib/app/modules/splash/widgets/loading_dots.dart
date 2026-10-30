import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final progress = (_controller.value - (index * 0.2)) % 1.0;

            final offset = -8 * (1 - (2 * progress - 1).abs());

            return Transform.translate(offset: Offset(0, offset), child: child);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: index == 0
                  ? AppColors.primary
                  : index == 1
                  ? AppColors.info
                  : AppColors.secondary,
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}
