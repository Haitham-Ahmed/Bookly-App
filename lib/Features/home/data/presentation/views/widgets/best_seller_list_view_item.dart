// import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
// import 'package:bookly_app/Features/home/data/presentation/views/widgets/book_rating.dart';
// import 'package:bookly_app/Features/home/data/presentation/views/widgets/custom_book_item.dart';
// import 'package:bookly_app/constants.dart';
// import 'package:bookly_app/core/utils/app_router.dart';
// import 'package:bookly_app/core/utils/assets.dart';
// import 'package:bookly_app/core/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class BookListViewItem extends StatelessWidget {
//   const BookListViewItem({super.key, required this.book});

//   final Book book;
//   @override

//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {

//         GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
//       },
//       child: SizedBox(
//         height: 125,
//         child: Row(
//           children: [
//             CustomBookImage(
//               imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
//             ),
//             const SizedBox(width: 30),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.5,
//                     child: Text(
//                       book.volumeInfo.title!,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: Styles.textStyle20.copyWith(
//                         fontFamily: KGtSectraFine,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                    Text(
//                     book.volumeInfo.authors![0],
//                      style: Styles.textStyle14),
//                   const SizedBox(height: 3),
//                   Row(
//                     children: [
//                       Text(
//                         'Free',
//                         style: Styles.textStyle20.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Spacer(),
//                        BookRating(
//                         rating: book.volumeInfo.averageRating?.round() ?? 0,
//                         count: book.volumeInfo.ratingsCount ?? 0,
//                        ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8), // إضافة padding عمودي
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر من الأعلى
            children: [
              // صورة الكتاب
              CustomBookImage(
                imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
              const SizedBox(width: 20), // تقليل المسافة بين الصورة والمحتوى
              
              // محتوى النص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع المساحة بين العناصر
                  children: [
                    // عنوان الكتاب
                    Text(
                      book.volumeInfo.title ?? 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle18.copyWith( // تقليل حجم الخط قليلاً
                        fontFamily: KGtSectraFine,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    // مؤلف الكتاب (مع معالجة القيم الفارغة)
                    Text(
                      book.volumeInfo.authors?.join(', ') ?? 'Unknown Author',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    
                    // السعر والتقييم
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const Spacer(),
                        BookRating(
                          rating: book.volumeInfo.averageRating?.round() ?? 0,
                          count: book.volumeInfo.ratingsCount ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}