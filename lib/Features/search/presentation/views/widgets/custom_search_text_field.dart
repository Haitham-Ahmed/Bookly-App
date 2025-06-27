// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class CustomSearchTextField extends StatelessWidget {
//   const CustomSearchTextField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         enabledBorder: buildOutlineInputBorder(),
//         focusedBorder: buildOutlineInputBorder(),
//         hintText: 'Search',
//         suffixIcon: IconButton(
//           onPressed: () {},
//           icon: const Opacity(
//             opacity: 0.8,
//             child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
//           ),
//         ),
//       ),
//     );
//   }

//   OutlineInputBorder buildOutlineInputBorder() {
//     return OutlineInputBorder(
//       borderSide: const BorderSide(color: Colors.white),
//       borderRadius: BorderRadius.circular(12),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.onSubmitted,
    required this.controller,
  });

  final Function(String) onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            onSubmitted(controller.text);
          },
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}