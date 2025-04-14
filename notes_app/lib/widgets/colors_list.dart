import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              colorIndex = index;
              BlocProvider.of<AddNoteCubit>(context).myColor = kcolors[index];
              setState(() {});
            },
            child: ColorItem(
              myColor: kcolors[index],
              isChosen: colorIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    required this.isChosen,
    required this.myColor,
    super.key,
  });

  final bool isChosen;
  final Color myColor;
  @override
  Widget build(BuildContext context) {
    return isChosen
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: myColor,
              radius: 36,
            ),
          )
        : CircleAvatar(
            backgroundColor: myColor,
            radius: 38,
          );
  }
}
