import 'dart:async';
import 'package:cupertino_theme_app/database/text_notes_crud.dart';
import 'package:cupertino_theme_app/models/text_notes_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

// Text Notes API
enum NoteActionState { loading, success, failed }

class TextNotesAPI extends ChangeNotifier {
  final Box<TextNote>
      _textNotesBox; // Change the type of _textNotesBox to Box<TextNote>

  TextNotesAPI(this._textNotesBox) {
    _textNotesBox.watch().listen((event) {
      notifyListeners();
    });
  }

  Future<Map<String, dynamic>> _performWithLoading(Function action) async {
    try {
      return await Future.wait<Map<String, dynamic>>([
        Future.delayed(Duration(seconds: 3)), // Simulate loading for 3 seconds
        action(),
      ]).then((results) {
        return {'state': NoteActionState.success, 'data': results[1]};
      });
    } catch (e) {
      return {'state': NoteActionState.failed, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> getAllTextNotes() async {
    return await _performWithLoading(() async {
      final crud = TextNotesCRUD(_textNotesBox);
      final notes = await crud.getAllTextNotes();
      return notes;
    });
  }

  Future<Map<String, dynamic>> searchTextNotesByName(String name) async {
    return await _performWithLoading(() async {
      final crud = TextNotesCRUD(_textNotesBox);
      final notes = await crud.searchTextNotesByName(name);
      return notes;
    });
  }

  Future<Map<String, dynamic>> createTextNote(TextNote note) async {
    // Change the parameter type to TextNote
    return await _performWithLoading(() async {
      final crud = TextNotesCRUD(_textNotesBox);
      await crud.createTextNote(note);
      return 'Text note created successfully';
    });
  }

  Future<Map<String, dynamic>> updateTextNote(
      int id, TextNote updatedNote) async {
    // Change the parameter type to TextNote
    return await _performWithLoading(() async {
      final crud = TextNotesCRUD(_textNotesBox);
      await crud.updateTextNote(id, updatedNote);
      return 'Text note updated successfully';
    });
  }

  Future<Map<String, dynamic>> deleteTextNoteById(int id) async {
    return await _performWithLoading(() async {
      final crud = TextNotesCRUD(_textNotesBox);
      await crud.deleteTextNoteById(id);
      return 'Text note deleted successfully';
    });
  }

  Future<Map<String, dynamic>> deleteAllTextNotes() async {
    return await _performWithLoading(() async {
      final crud = TextNotesCRUD(_textNotesBox);
      await crud.deleteAllTextNotes();
      return 'All text notes deleted successfully';
    });
  }
}
