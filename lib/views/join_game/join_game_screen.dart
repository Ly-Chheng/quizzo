// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:quizzo/core/utils/app_fonts.dart';
// import 'package:get/get.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:quizzo/widgets/animated_button.dart';

// class JoinGameScreen extends StatefulWidget {
//   const JoinGameScreen({super.key});

//   @override
//   State<JoinGameScreen> createState() => _JoinGameScreenState();
// }

// class _JoinGameScreenState extends State<JoinGameScreen> {
//   int selectedIndex = 0;
//   final TextEditingController _pinController = TextEditingController();
//   String? scannedResult;
//   final MobileScannerController cameraController = MobileScannerController();

//   /// Process QR code result here
//   void _processQRCode(String? code) {
//     if (code == null) return;

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Scanned: $code")),
//     );
//   }

//   @override
//   void dispose() {
//     // cameraController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: selectedIndex == 0 
//                 ? [Color(0xFFFFA63D), Color.fromARGB(255, 227, 139, 39)] // Original orange gradient for Enter PIN
//                 : [Color(0xF0000000), Color(0xF0000000)], // Purple gradient for QR Code scanner
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.close, color: Colors.white),
//                       onPressed: () {
//                         Get.back();
//                       },
//                     ),
//                     const Spacer(),
//                     Text("Join Game",
//                         style: Style.headerTextStyleBold22_24(context)),
//                     const Spacer(),
//                     const SizedBox(width: 48),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     _buildToggleButton("Enter PIN", 0),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     _buildToggleButton("Scan QR Code", 1),
//                   ],
//                 ),
//                 Expanded(
//                   child: IndexedStack(
//                     index: selectedIndex,
//                     children: [
//                       _buildEnterPinView(),
//                       _buildQrCodeView(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildToggleButton(String text, int index) {
//     bool isSelected = selectedIndex == index;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => setState(() => selectedIndex = index),
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           decoration: BoxDecoration(
//             color: isSelected ? Colors.white : Colors.transparent,
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(
//                 color: isSelected ? Colors.transparent : Colors.white,
//                 width: 2),
//           ),
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: isSelected ? Color(0xFFFFA63D) : Colors.white,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildEnterPinView() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Spacer(),
//         TextField(
//           controller: _pinController,
//           keyboardType: TextInputType.number,
//           textAlign: TextAlign.center,
//           keyboardAppearance: Brightness.light,
//           style: Style.subHeaderTextStyleGray22_24(context),
//           decoration: const InputDecoration(
//             border: InputBorder.none,
//             hintText: 'ENTER PIN',
//             hintStyle: TextStyle(color: Colors.white54, fontSize: 24),
//           ),
//         ),
//         const SizedBox(height: 30),
//         Spacer(),
//         AnimatedButton(
//           width: double.infinity,
//           height: (Get.context?.isPhone ?? true) ? 50 : 60,
//           color: const Color(0XFFFFFFFF),
//           borderRadius: 25,
//           shadowDegree: ShadowDegree.dark,
//           duration: 100,
//           enabled: true,
//           onPressed: () {},
//           child: Text(
//             "JOIN NOW",
//             style: Style.button(context),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildQrCodeView() {
//     return Column(
//       children: [
//         const SizedBox(height: 40),

//         // Camera scanner with custom overlay
//         Expanded(
//           flex: 3,
//           child: Center(
//             child: AspectRatio(
//               aspectRatio: 1.0,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     MobileScanner(
//                       controller: cameraController,
//                       onDetect: (capture) {
//                         final List<Barcode> barcodes = capture.barcodes;
//                         for (final barcode in barcodes) {
//                           setState(() {
//                             scannedResult = barcode.rawValue;
//                           });
//                           _processQRCode(scannedResult);
//                         }
//                       },
//                     ),

//                     // Overlay
//                     CustomPaint(
//                       painter: QRScannerOverlay(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),

//         const SizedBox(height: 40),

//         // Control buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFFFFA63D).withOpacity(0.2),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: IconButton(
//                   icon: const Icon(Icons.photo, color: Colors.white, size: 25),
//                   onPressed: () async {
//                     final ImagePicker picker = ImagePicker();
//                     final XFile? image =
//                     await picker.pickImage(source: ImageSource.gallery);

//                     if (image != null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Selected image: ${image.path}")),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(width: 30),
//             GestureDetector(
//               onTap: () {
//                 cameraController.start();
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFFFFA63D),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: const Icon(Icons.qr_code_scanner,
//                       size: 50, color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 30),
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFFFFA63D).withOpacity(0.2),
//               ),
//               child: IconButton(
//                 icon: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: const Icon(Icons.switch_camera,
//                       color: Colors.white, size: 25),
//                 ),
//                 onPressed: () => cameraController.switchCamera(),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

// }

// class QRScannerOverlay extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black.withOpacity(0.5)
//       ..style = PaintingStyle.fill;

//     // Draw semi-transparent background
//     canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

//     // Define scan area (center square)
//     double scanArea = size.width * 0.7;
//     final scanRect = Rect.fromCenter(
//       center: size.center(Offset.zero),
//       width: scanArea,
//       height: scanArea,
//     );

//     // Clear center area
//     canvas.saveLayer(scanRect, Paint());
//     paint.blendMode = BlendMode.clear;
//     canvas.drawRect(scanRect, paint);
//     canvas.restore();

//     // Draw border corners
//     final borderPaint = Paint()
//       ..color = Colors.orangeAccent
//       ..strokeWidth = 6
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     const cornerLength = 40.0;

//     // Top-left
//     canvas.drawLine(scanRect.topLeft,
//         scanRect.topLeft + Offset(cornerLength, 0), borderPaint);
//     canvas.drawLine(scanRect.topLeft,
//         scanRect.topLeft + Offset(0, cornerLength), borderPaint);

//     // Top-right
//     canvas.drawLine(scanRect.topRight,
//         scanRect.topRight + Offset(-cornerLength, 0), borderPaint);
//     canvas.drawLine(scanRect.topRight,
//         scanRect.topRight + Offset(0, cornerLength), borderPaint);

//     // Bottom-left
//     canvas.drawLine(scanRect.bottomLeft,
//         scanRect.bottomLeft + Offset(cornerLength, 0), borderPaint);
//     canvas.drawLine(scanRect.bottomLeft,
//         scanRect.bottomLeft + Offset(0, -cornerLength), borderPaint);

//     // Bottom-right
//     canvas.drawLine(scanRect.bottomRight,
//         scanRect.bottomRight + Offset(-cornerLength, 0), borderPaint);
//     canvas.drawLine(scanRect.bottomRight,
//         scanRect.bottomRight + Offset(0, -cornerLength), borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

class JoinGameScreen extends StatefulWidget {
  const JoinGameScreen({super.key});

  @override
  State<JoinGameScreen> createState() => _JoinGameScreenState();
}

class _JoinGameScreenState extends State<JoinGameScreen> {
  int selectedIndex = 0;
  final TextEditingController _pinController = TextEditingController();
  String? scannedResult;
  final MobileScannerController cameraController = MobileScannerController();

  /// Process QR code result here
  void _processQRCode(String? code) {
    if (code == null || code == scannedResult) return;

    setState(() => scannedResult = code);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Scanned: $code")),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: selectedIndex == 0
                ? [const Color(0xFFFFA63D), const Color.fromARGB(255, 227, 139, 39)] // Orange gradient for Enter PIN
                : [const Color(0xFF000000), const Color(0xFF000000)], // Purple-black gradient for QR
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    const Spacer(),
                    Text("Join Game", style: Style.headerTextStyleBold22_24(context)),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildToggleButton("Enter PIN", 0),
                    const SizedBox(width: 20),
                    _buildToggleButton("Scan QR Code", 1),
                  ],
                ),
                Expanded(
                  child: IndexedStack(
                    index: selectedIndex,
                    children: [
                      _buildEnterPinView(),
                      _buildQrCodeView(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, int index) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.white,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? const Color(0xFFFFA63D) : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEnterPinView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        TextField(
          controller: _pinController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          keyboardAppearance: Brightness.light,
          style: Style.subHeaderTextStyleGray22_24(context),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'ENTER PIN',
            hintStyle: TextStyle(color: Colors.white54, fontSize: 24),
          ),
        ),
        const SizedBox(height: 30),
        const Spacer(),
        AnimatedButton(
          width: double.infinity,
          height: (Get.context?.isPhone ?? true) ? 50 : 60,
          color: const Color(0XFFFFFFFF),
          borderRadius: 25,
          shadowDegree: ShadowDegree.dark,
          duration: 100,
          enabled: true,
          onPressed: () {},
          child: Text(
            "JOIN NOW",
            style: Style.button(context),
          ),
        ),
      ],
    );
  }

  Widget _buildQrCodeView() {
    return Column(
      children: [
        const SizedBox(height: 40),

        // Camera scanner with custom overlay
        Expanded(
          flex: 3,
          child: Center(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    MobileScanner(
                      controller: cameraController,
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        for (final barcode in barcodes) {
                          _processQRCode(barcode.rawValue);
                        }
                      },
                    ),

                    // Overlay
                    const QRScannerOverlay(),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 40),

        // Control buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFA63D).withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  icon: const Icon(Icons.photo, color: Colors.white, size: 25),
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (image != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Selected image: ${image.path}")),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                cameraController.start();
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFA63D),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.qr_code_scanner, size: 50, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFA63D).withOpacity(0.2),
              ),
              child: IconButton(
                icon: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.switch_camera, color: Colors.white, size: 25),
                ),
                onPressed: () => cameraController.switchCamera(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Overlay widget with purple corners + animated scanning line
class QRScannerOverlay extends StatefulWidget {
  const QRScannerOverlay({super.key});

  @override
  State<QRScannerOverlay> createState() => _QRScannerOverlayState();
}

class _QRScannerOverlayState extends State<QRScannerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scanSize = constraints.maxWidth * 0.7;
        final left = (constraints.maxWidth - scanSize) / 2;
        final top = (constraints.maxHeight - scanSize) / 2;

        return Stack(
          children: [
            CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: _OverlayPainter(scanSize),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  left: left,
                  top: top + (scanSize * _animation.value),
                  child: Container(
                    width: scanSize,
                    height: 4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFA63D).withOpacity(0.1),
                          Color(0xFFFFA63D),
                          Color(0xFFFFA63D).withOpacity(0.1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _OverlayPainter extends CustomPainter {
  final double scanSize;
  _OverlayPainter(this.scanSize);

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = Colors.black.withOpacity(0.5);

    // Dark background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Cut-out area
    final cutOutRect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: scanSize,
      height: scanSize,
    );
    final bgPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final cutOutPath = Path()..addRect(cutOutRect);

    // Clear the middle
    canvas.drawPath(
      Path.combine(PathOperation.difference, bgPath, cutOutPath),
      backgroundPaint,
    );

    // Purple corners
    final cornerPaint = Paint()
      ..color = Color(0xFFFFA63D)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const cornerLength =30.0;

    // top-left
    canvas.drawLine(cutOutRect.topLeft,
        cutOutRect.topLeft + Offset(cornerLength, 0), cornerPaint);
    canvas.drawLine(cutOutRect.topLeft,
        cutOutRect.topLeft + Offset(0, cornerLength), cornerPaint);

    // top-right
    canvas.drawLine(cutOutRect.topRight,
        cutOutRect.topRight + Offset(-cornerLength, 0), cornerPaint);
    canvas.drawLine(cutOutRect.topRight,
        cutOutRect.topRight + Offset(0, cornerLength), cornerPaint);

    // bottom-left
    canvas.drawLine(cutOutRect.bottomLeft,
        cutOutRect.bottomLeft + Offset(cornerLength, 0), cornerPaint);
    canvas.drawLine(cutOutRect.bottomLeft,
        cutOutRect.bottomLeft + Offset(0, -cornerLength), cornerPaint);

    // bottom-right
    canvas.drawLine(cutOutRect.bottomRight,
        cutOutRect.bottomRight + Offset(-cornerLength, 0), cornerPaint);
    canvas.drawLine(cutOutRect.bottomRight,
        cutOutRect.bottomRight + Offset(0, -cornerLength), cornerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
