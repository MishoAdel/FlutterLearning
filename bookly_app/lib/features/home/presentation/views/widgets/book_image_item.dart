// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImageItem extends StatelessWidget {
  const BookImageItem({
    super.key,
    required this.imgUrl,
  });

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      // GoRouter.of(context).push(AppRouter.kBookDetailsView);
      // },
      child: Padding(
        padding: const EdgeInsets.only(right: 18),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 2.6 / 4,
            child: Image(image: NetworkImage(imgUrl)),
            // child: CachedNetworkImage(
            //   placeholder: (context, url) => const Center(
            //     child: CircularProgressIndicator(),
            //   ),
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            //   fit: BoxFit.fill,
            //   imageUrl: imgUrl,
            // ),
          ),
        ),
      ),
    );
  }
}
