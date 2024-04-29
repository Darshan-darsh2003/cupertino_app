import 'dart:async';
import 'package:cupertino_theme_app/database/code_notes_crud.dart';
import 'package:cupertino_theme_app/models/code_notes_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

// Code Notes API
enum CodeNoteActionState { loading, success, failed }

class CodeNotesAPI extends ChangeNotifier {
  final Box<CodeNote>
      _codeNotesBox; // Change the type of _codeNotesBox to Box<TextNote>

  CodeNotesAPI(this._codeNotesBox) {
    _codeNotesBox.watch().listen((event) {
      notifyListeners();
    });
  }

  Future<Map<String, dynamic>> _performWithLoading(Function action) async {
    try {
      return await Future.wait<Map<String, dynamic>>([
        Future.delayed(Duration(seconds: 3)), // Simulate loading for 3 seconds
        action(),
      ]).then((results) {
        return {'state': CodeNoteActionState.success, 'data': results[1]};
      });
    } catch (e) {
      return {'state': CodeNoteActionState.failed, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> getAllCodeNotes() async {
    return await _performWithLoading(() async {
      final crud = CodeNotesCRUD(_codeNotesBox);
      final notes = await crud.getAllCodeNotes();
      return notes;
    });
  }

  Future<Map<String, dynamic>> searchCodeNotesByName(String name) async {
    return await _performWithLoading(() async {
      final crud = CodeNotesCRUD(_codeNotesBox);
      final notes = await crud.searchCodeNotesByName(name);
      return notes;
    });
  }

  Future<Map<String, dynamic>> createCodeNote(CodeNote note) async {
    // Change the parameter type to CodeNote
    return await _performWithLoading(() async {
      final crud = CodeNotesCRUD(_codeNotesBox);
      await crud.createCodeNote(note);
      return 'Code note created successfully';
    });
  }

  Future<Map<String, dynamic>> updateCodeNote(
      int id, CodeNote updatedNote) async {
    // Change the parameter type to CodeNote
    return await _performWithLoading(() async {
      final crud = CodeNotesCRUD(_codeNotesBox);
      await crud.updateCodeNote(id, updatedNote);
      return 'Code note updated successfully';
    });
  }

  Future<Map<String, dynamic>> deleteCodeNoteById(int id) async {
    return await _performWithLoading(() async {
      final crud = CodeNotesCRUD(_codeNotesBox);
      await crud.deleteCodeNoteById(id);
      return 'Code note deleted successfully';
    });
  }

  Future<Map<String, dynamic>> deleteAllCodeNotes() async {
    return await _performWithLoading(() async {
      final crud = CodeNotesCRUD(_codeNotesBox);
      await crud.deleteAllCodeNotes();
      return 'All code notes deleted successfully';
    });
  }
}
