part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNotesFailure extends AddNoteState {
  final String errMessage;

  AddNotesFailure(this.errMessage);
}
