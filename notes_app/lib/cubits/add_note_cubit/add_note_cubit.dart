import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color? myColor = const Color(0xffAC3931);

  addMyNote(NoteModel myNote) async {
    myNote.color = myColor!.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(myNote);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(
        AddNoteFailed(
          errMsg: e.toString(),
        ),
      );
    }
  }
}
