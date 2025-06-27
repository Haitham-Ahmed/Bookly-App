// import 'package:bookly_app/core/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class BookRating extends StatelessWidget {
//   const BookRating({
//     super.key,
//     this.mainAxisAlignment = MainAxisAlignment.start,
//     required this.rating ,
//     required this.count,
//   });

//   final MainAxisAlignment mainAxisAlignment;
//   final num rating;
//   final int count;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: mainAxisAlignment,
//       children: [
//         const Icon(
//           FontAwesomeIcons.solidStar,
//           size: 14,
//           color: Color(0xffFFDD4F),
//         ),
//         const SizedBox(width: 6.3),
//          Text(
//           rating.toString(),
//            style: Styles.textStyle16),
//         const SizedBox(width: 5),
//         Opacity(
//           opacity: 0.5,
//           child: Text(
//             '($count)',
//             style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
//           ),
//         ),
//       ],
//     );
//   }
// }





import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num? rating; // جعلها nullable
  final int? count;   // جعلها nullable

  @override
  Widget build(BuildContext context) {
    final hasRating = rating != null && rating! > 0;
    final hasCount = count != null && count! > 0;

    if (!hasRating && !hasCount) {
      return const SizedBox.shrink(); // لا تعرض أي شيء إذا لم يكن هناك تقييمات
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (hasRating) ...[
          const Icon(
            FontAwesomeIcons.solidStar,
            size: 14,
            color: Color(0xffFFDD4F),
          ),
          const SizedBox(width: 6.3),
          Text(
            rating!.toStringAsFixed(1), // عرض بتنسيق منزلة عشرية واحدة
            style: Styles.textStyle16,
          ),
        ],
        if (hasCount) ...[
          if (hasRating) const SizedBox(width: 5),
          Opacity(
            opacity: 0.5,
            child: Text(
              '($count)',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}