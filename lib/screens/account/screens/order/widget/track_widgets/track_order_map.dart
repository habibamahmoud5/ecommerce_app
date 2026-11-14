import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrderMap extends StatelessWidget {
  final ValueNotifier<double> sheetProgress;

  const TrackOrderMap({super.key, required this.sheetProgress});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final baseVerticalShift = height * 0.08;
        final maxExtraShift = height * 0.15;

        return ValueListenableBuilder<double>(
          valueListenable: sheetProgress,
          builder: (context, progress, child) {
            final extraShift = maxExtraShift * progress;

            return Stack(
              children: [
                _buildMapImage(extraShift: extraShift),

                _buildRoute(
                  width: width,
                  height: height,
                  baseVerticalShift: baseVerticalShift,
                  extraShift: extraShift,
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildMapImage({required double extraShift}) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeOut,
      left: 0,
      right: 0,
      top: -extraShift * 0.4,
      bottom: extraShift * 0.4,
      child: Image.asset('assets/images/map.png', fit: BoxFit.cover),
    );
  }

  Widget _buildRoute({
    required double width,
    required double height,
    required double baseVerticalShift,
    required double extraShift,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(
        0,
        -(baseVerticalShift + extraShift),
        0,
      ),
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/images/black_line.png')),

          Positioned(
            left: width * 0.26,
            top: height * 0.58,
            child: Image.asset('assets/images/home_point.png', width: 50.w),
          ),

          Positioned(
            left: width * 0.42,
            top: height * 0.42,
            child: Image.asset('assets/images/truck_point.png', width: 50.w),
          ),

          Positioned(
            left: width * 0.76,
            top: height * 0.35,
            child: Image.asset('assets/images/location_point.png', width: 50.w),
          ),
        ],
      ),
    );
  }
}
