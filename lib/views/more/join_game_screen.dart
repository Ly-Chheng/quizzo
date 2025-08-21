import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animated_button.dart';

class JoinGameScreen extends StatefulWidget {
  const JoinGameScreen({super.key});

  @override
  State<JoinGameScreen> createState() => _JoinGameScreenState();
}

class _JoinGameScreenState extends State<JoinGameScreen> {

  int selectedIndex = 0;
  final TextEditingController _pinController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xFFFFA63D), Color.fromARGB(255, 234, 161, 77)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 12),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      Text(
                        "Join Game",
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                Row(
                  children: [
                    _buildToggleButton("Enter PIN", 0),
                    SizedBox(width: 20,),
                    _buildToggleButton("Scan QR Code", 1),
                  ],
                ),
                Spacer(),
                Expanded(
                  child: IndexedStack(
                    index: selectedIndex,
                    children: [
                      _buildEnterPinView(),
                      _buildQrCodeView(),
                    ],
                  ),
                ),
                SizedBox(height: 30,)
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
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          border: Border.all(
        color: isSelected ? Colors.transparent : Colors.white,
        width: 2
      ),
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
        TextField(
          controller: _pinController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style:TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
        onPressed: () {
           
         },
         child: Text(
           "JOIN NOW",
           style: TextStyle(
             fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
             color: Color(0xFFFFA63D),
             fontWeight: FontWeight.w600,
           ),
         ),
       ),
      ],
    );
  }

  Widget _buildQrCodeView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Icon(Icons.qr_code, color: Colors.white, size: 120),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
          ),
          onPressed: () {},
          child: const Text(
            "SCAN NOW",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}