import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:quizzo/widgets/animated_button.dart';

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
    if (code == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Scanned: $code")),
    );
  }

  @override
  void dispose() {
    // cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: selectedIndex == 0 
                ? [Color(0xFFFFA63D), Color.fromARGB(255, 227, 139, 39)] // Original orange gradient for Enter PIN
                : [Color(0xF0000000), Color(0xF0000000)], // Purple gradient for QR Code scanner
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
                    Text("Join Game",
                        style: Style.headerTextStyleBold22_24(context)),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    _buildToggleButton("Enter PIN", 0),
                    SizedBox(
                      width: 20,
                    ),
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
                SizedBox(
                  height: 30,
                )
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
                width: 2),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Color(0xFFFFA63D) : Colors.white,
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
        Spacer(),
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
        Spacer(),
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
        
        // Camera scanner with fixed aspect ratio and centering
        Expanded(
          flex: 3, // Give more space to the scanner
          child: Center(
            child: AspectRatio(
              aspectRatio: 1.0, // Square aspect ratio
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Optional: rounded corners
                child: MobileScanner(
                  controller: cameraController,
                  onDetect: (capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    for (final barcode in barcodes) {
                      setState(() {
                        scannedResult = barcode.rawValue;
                      });
                      _processQRCode(scannedResult);
                    }
                  },
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFA63D),
              ),
              child: IconButton(
                icon: const Icon(Icons.photo, color: Colors.white, size: 30),
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (image != null) {
                    // TODO: pass the picked image to a QR code decoder
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Selected image: ${image.path}")),
                    );
                  }
                },
              ),
            ),

            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                cameraController.start();
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFFFA63D)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: const Icon(Icons.qr_code_scanner,
                      size: 50, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,color: Color(0xFFFFA63D).withOpacity(0.2),),
              child: IconButton(
                icon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(Icons.switch_camera,
                      color: Colors.white, size: 25),
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
