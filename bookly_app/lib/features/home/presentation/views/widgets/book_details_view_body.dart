import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating_row.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/related_books_listview.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const BookDetailsAppbar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                child: BookImageItem(
                  imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                      'https://media.licdn.com/dms/image/v2/C5603AQHuQx2YhUoCjw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1596617869057?e=1734566400&v=beta&t=TSR4tOJllp4XGxitG6A56_mxLk3XpjrVTQ-fKUPeJ0U',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                bookModel.volumeInfo.title!,
                style: Styles.textStyle30,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                bookModel.volumeInfo.authors![0],
                style:
                    Styles.textStyle18.copyWith(color: const Color(0xff707070)),
              ),
              const SizedBox(
                height: 18,
              ),
              RatingRow(
                rating: bookModel.volumeInfo.averageRating ?? 0,
                ratingCount: bookModel.volumeInfo.ratingsCount ?? 0,
              ),
              const SizedBox(
                height: 37,
              ),
              const BookAction(),
              const SizedBox(
                height: 37,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You may also like',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const RelatedBooksListview(),
            ],
          ),
        )
      ],
    );
  }
}
