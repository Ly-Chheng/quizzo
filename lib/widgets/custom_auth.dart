// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomUnderlineInput extends StatefulWidget {
//   final TextEditingController controller;
//   final String? hintText;
//   final bool isPassword;
//   final IconData? suffixIcon;
//   final Color underlineColor;
//   final Color iconColor;

//   const CustomUnderlineInput({
//     super.key,
//     required this.controller,
//     this.hintText,
//     this.isPassword = false,
//     this.suffixIcon,
//     this.underlineColor = const Color(0xFFFFA63D),
//     this.iconColor = Colors.orangeAccent,
//   });

//   @override
//   State<CustomUnderlineInput> createState() => _CustomUnderlineInputState();
// }

// class _CustomUnderlineInputState extends State<CustomUnderlineInput> {
//   bool passwordVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     passwordVisible = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: widget.controller,
//       obscureText: widget.isPassword && !passwordVisible,
//       decoration: InputDecoration(
//         // hintText: widget.hintText,

//         label: RichText(
//           text: TextSpan(
//             text: 'email_phone',
//             style: TextStyle(
//               fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
//               color: const Color(0xFFFFA63D),
//               fontWeight: FontWeight.w600,
//             ),
//             children: [
//               TextSpan(
//                 text: ' *',
//                 style: TextStyle(
//                   color: Colors.red, // Makes the asterisk red
//                 ),
//               ),
//             ],
//           ),
//         ),

//         suffixIcon: widget.isPassword
//             ? IconButton(
//                 icon: Icon(
//                   passwordVisible ? Icons.visibility : Icons.visibility_off,
//                   color: widget.iconColor,
//                 ),
//                 onPressed: () => setState(() {
//                   passwordVisible = !passwordVisible;
//                 }),
//               )
//             : (widget.suffixIcon != null
//                 ? Icon(widget.suffixIcon, color: widget.iconColor)
//                 : null),
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: widget.underlineColor),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: widget.underlineColor, width: 2),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomUnderlineInput extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText; // Changed from hintText for clarity
  final bool isPassword;
  final IconData? suffixIcon;
  final Color underlineColor;
  final Color iconColor;
  final bool? isRequired;

  const CustomUnderlineInput({
    super.key,
    required this.controller,
    this.labelText,
    this.isPassword = false,
    this.suffixIcon,
    this.underlineColor = const Color(0xFFFFA63D),
    this.iconColor = Colors.orangeAccent,
    this.isRequired = false,
  });

  @override
  State<CustomUnderlineInput> createState() => _CustomUnderlineInputState();
}

class _CustomUnderlineInputState extends State<CustomUnderlineInput> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword && !passwordVisible,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: widget.labelText ?? '',
            style: TextStyle(
              fontSize: context.isPhone ? 16 : 18, // Safe GetX usage
              color: widget.underlineColor,
              fontWeight: FontWeight.w600,
            ),
           children: (widget.isRequired ?? false)
                ? const [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]
                : [],
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: widget.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              )
            : (widget.suffixIcon != null
                ? Icon(widget.suffixIcon, color: widget.iconColor)
                : null),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor, width: 2),
        ),
      ),
    );
  }
}
