import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edited_color_list.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).getAllNotes();
                Navigator.pop(context);
              },
              endIcon: const Icon(Icons.check),
              titleText: 'Edit Note',
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              onChanged: (val) {
                title = val;
              },
              hintText: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (val) {
                content = val;
              },
              hintText: 'Content',
              maxLines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            EditedColorList(
              myNote: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}
