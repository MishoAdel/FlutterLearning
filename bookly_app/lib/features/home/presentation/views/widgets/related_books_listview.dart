import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_progress_indicator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/related_books_cubit/related_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedBooksListview extends StatelessWidget {
  const RelatedBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
      builder: (context, state) {
        if (state is RelatedBooksSucess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BookImageItem(
                  imgUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ??
                      'https://media.licdn.com/dms/image/v2/C5603AQHuQx2YhUoCjw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1596617869057?e=1734566400&v=beta&t=TSR4tOJllp4XGxitG6A56_mxLk3XpjrVTQ-fKUPeJ0U',
                );
              },
            ),
          );
        } else if (state is RelatedBooksIFailed) {
          return CustomErrorWidget(errMsg: state.errMsg);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
