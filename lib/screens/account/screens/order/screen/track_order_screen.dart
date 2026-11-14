import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/account/screens/order/widget/track_widgets/order_status_sheet.dart';
import 'package:ecommerce_app/screens/account/screens/order/widget/track_widgets/track_order_map.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  final ValueNotifier<double> _sheetProgress = ValueNotifier(0.0);

  static const double _minSize = 0.15;
  static const double _initialSize = 0.35;
  static const double _maxSize = 0.85;

  @override
  void initState() {
    super.initState();

    _sheetController.addListener(_onSheetChanged);
  }

  void _onSheetChanged() {
    final size = _sheetController.size;

    final progress = ((size - _minSize) / (_maxSize - _minSize)).clamp(
      0.0,
      1.0,
    );

    _sheetProgress.value = progress;
  }

  @override
  void dispose() {
    _sheetController.removeListener(_onSheetChanged);
    _sheetController.dispose();
    _sheetProgress.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                15.verticalSpace,
                AppBarText(
                  title: 'Track Order',
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: AppColors.black,
                    ),
                  ),
                  action: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      size: 24,
                      color: AppColors.black,
                    ),
                  ),
                ),

                10.verticalSpace,

                Expanded(child: TrackOrderMap(sheetProgress: _sheetProgress)),
              ],
            ),
          ),

          OrderStatusSheet(
            sheetController: _sheetController,
            minSize: _minSize,
            initialSize: _initialSize,
            maxSize: _maxSize,
          ),
        ],
      ),
    );
  }
}
