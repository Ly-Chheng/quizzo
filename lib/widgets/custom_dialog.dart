import 'package:flutter/material.dart'; 
import 'package:quizzo/widgets/loading_screen.dart'; 
 
class SuccessDialog extends StatelessWidget { 
  final String title; 
  final String subtitle; 
  final IconData icon; 
  final Color primaryColor; 
  final Color secondaryColor; 
  final bool showLoader; 
  final VoidCallback? onTap; 
  final double borderRadius; 
  final EdgeInsets padding; 
  final double iconSize; 
  final double containerSize; 
 
  const SuccessDialog({ 
    super.key, 
    this.title = 'Successful!', 
    this.subtitle = 'Please wait a moment, we are preparing for you...', 
    this.icon = Icons.person, 
    this.primaryColor = const Color(0xFFFFA63D), 
    this.secondaryColor = const Color.fromARGB(255, 238, 165, 81), 
    this.showLoader = true, 
    this.onTap, 
    this.borderRadius = 30, 
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 32), 
    this.iconSize = 50, 
    this.containerSize = 100, 
  }); 
 
  @override 
  Widget build(BuildContext context) { 
    return Dialog( 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)), 
      backgroundColor: Colors.white, 
      child: GestureDetector( 
        onTap: onTap, 
        child: Padding( 
          padding: padding, 
          child: Column( 
            mainAxisSize: MainAxisSize.min, 
            children: [ 
              // Profile icon with gradient background 
              Container( 
                width: containerSize, 
                height: containerSize, 
                decoration: BoxDecoration( 
                  shape: BoxShape.circle, 
                  gradient: LinearGradient( 
                    colors: [primaryColor, secondaryColor], 
                    begin: Alignment.topLeft, 
                    end: Alignment.bottomRight, 
                  ), 
                ), 
                child: Icon(icon, color: Colors.white, size: iconSize), 
              ), 
              const SizedBox(height: 24), 
 
              // Title 
              Text( 
                title, 
                style: TextStyle( 
                  fontSize: 22, 
                  fontWeight: FontWeight.bold, 
                  color: primaryColor, 
                ), 
              ), 
              const SizedBox(height: 8), 
 
              // Subtitle 
              Text( 
                subtitle, 
                textAlign: TextAlign.center, 
                style: const TextStyle(fontSize: 16, color: Colors.black54), 
              ), 
              const SizedBox(height: 24), 
 
              // Conditional loader using ternary operator
              showLoader ? RotatingDotsLoader() : Container(
                
                width: double.infinity,
               
                decoration: BoxDecoration(
                   color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: TextButton(
                  onPressed: () {}, 
                  child: Text("Go to home",style: TextStyle(color: Color(0XFFFFFFFF),fontWeight: FontWeight.w600),)
                ),
              ),
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
}
