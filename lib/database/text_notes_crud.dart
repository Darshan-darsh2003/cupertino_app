import 'package:cupertino_theme_app/models/text_notes_model.dart';
import 'package:hive/hive.dart';

class TextNotesCRUD {
  final Box<TextNote>
      _textNotesBox; // Change the type of _textNotesBox to Box<TextNote>

  TextNotesCRUD(this._textNotesBox);

  Future<List<TextNote>> getAllTextNotes() async {
    try {
      return _textNotesBox.values.toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<TextNote>> searchTextNotesByName(String name) async {
    try {
      return _textNotesBox.values
          .where((note) =>
              note.title == name) // Access the title property of TextNote model
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> createTextNote(TextNote note) async {
    // Change the parameter type to TextNote
    try {
      await _textNotesBox.add(note);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateTextNote(int id, TextNote updatedNote) async {
    // Change the parameter type to TextNote
    try {
      await _textNotesBox.put(id, updatedNote);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteTextNoteById(int id) async {
    try {
      await _textNotesBox.delete(id);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteAllTextNotes() async {
    try {
      await _textNotesBox.clear();
    } catch (e) {
      throw e.toString();
    }
  }
}
