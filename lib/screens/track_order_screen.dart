import 'package:flutter/material.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  // Tracks how "open" the sheet is, from 0.0 (min) to 1.0 (max)
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
    // Normalize current size into a 0-1 progress value
    final size = _sheetController.size;
    final progress =
        ((size - _minSize) / (_maxSize - _minSize)).clamp(0.0, 1.0);
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
      body: Stack(
        children: [
          // ---------- MAP + HEADER (background layer) ----------
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      const Spacer(),
                      const Text(
                        'Track Order',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.notifications_none),
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final height = constraints.maxHeight;
                      final double baseVerticalShift = height * 0.08;

                      // Extra shift applied as the sheet opens further
                      final double maxExtraShift = height * 0.15;

                      return ValueListenableBuilder<double>(
                        valueListenable: _sheetProgress,
                        builder: (context, progress, child) {
                          final double extraShift = maxExtraShift * progress;

                          return Stack(
                            children: [
                              // Map itself also nudges up slightly with the sheet
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 50),
                                curve: Curves.easeOut,
                                left: 0,
                                right: 0,
                                top: -extraShift * 0.4,
                                bottom: extraShift * 0.4,
                                child: Image.asset(
                                  'assets/images/map.png',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Line + markers move up together, more than the map
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 50),
                                curve: Curves.easeOut,
                                transform: Matrix4.translationValues(
                                  0,
                                  -(baseVerticalShift + extraShift),
                                  0,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                          'assets/images/black_line.png'),
                                    ),
                                    Positioned(
                                      left: width * 0.26,
                                      top: height * 0.58,
                                      child: Image.asset(
                                          'assets/images/home_point.png',
                                          width: 50),
                                    ),
                                    Positioned(
                                      left: width * 0.42,
                                      top: height * 0.42,
                                      child: Image.asset(
                                          'assets/images/truck_point.png',
                                          width: 50),
                                    ),
                                    Positioned(
                                      left: width * 0.76,
                                      top: height * 0.35,
                                      child: Image.asset(
                                          'assets/images/location_point.png',
                                          width: 50),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          DraggableScrollableSheet(
            controller: _sheetController,
            initialChildSize: _initialSize,
            minChildSize: _minSize,
            maxChildSize: _maxSize,
            snap: true,
            snapSizes: [_minSize, _initialSize, _maxSize],
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 5,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Order Status',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.close),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 8),
                        _StatusStep(
                          title: 'Packing',
                          subtitle:
                              '2336 Jack Warren Rd, Delta Junction, Alaska 9...',
                          filled: true,
                          showLine: true,
                        ),
                        _StatusStep(
                          title: 'Picked',
                          subtitle:
                              '2417 Tongass Ave #111, Ketchikan, Alaska 99901...',
                          filled: true,
                          showLine: true,
                        ),
                        _StatusStep(
                          title: 'In Transit',
                          subtitle:
                              '16 Rr 2, Ketchikan, Alaska 99901, USA',
                          filled: true,
                          showLine: true,
                        ),
                        _StatusStep(
                          title: 'Delivered',
                          subtitle:
                              '925 S Chugach St #APT 10, Alaska 99645',
                          filled: false,
                          showLine: false,
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 26,
                              backgroundImage:
                                  AssetImage('assets/images/delivery_guy.png'),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jacob Jones',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Delivery Guy',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey[200],
                              child: const Icon(Icons.call,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatusStep extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool filled;
  final bool showLine;

  const _StatusStep({
    required this.title,
    required this.subtitle,
    required this.filled,
    required this.showLine,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                Icons.circle,
                size: 20,
                color: filled ? Colors.black : Colors.grey[300],
              ),
              if (showLine)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey[300],
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
