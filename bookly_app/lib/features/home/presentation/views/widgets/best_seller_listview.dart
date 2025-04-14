import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_progress_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
        builder: (context, state) {
          if (state is BestSellerBooksSuccess) {
            return ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return BestSellerCard(
                  bookModel: state.books[index],
                  rating: state.books[index].volumeInfo.averageRating ?? 0,
                  ratingCount: state.books[index].volumeInfo.ratingsCount ?? 0,
                );
              },
            );
          } else if (state is BestSellerBooksFailed) {
            return CustomErrorWidget(errMsg: state.errMsg);
          } else {
            return const CustomProgressIndicator();
          }
        },
      ),
    );
  }
}
