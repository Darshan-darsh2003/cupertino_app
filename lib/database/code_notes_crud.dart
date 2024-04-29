import 'dart:async';
import 'package:cupertino_theme_app/models/code_notes_model.dart';
import 'package:hive/hive.dart';

// Code Notes CRUD Operations
class CodeNotesCRUD {
  final Box<CodeNote>
      _codeNotesBox; // Change the type of _codeNotesBox to Box<CodeNote>

  CodeNotesCRUD(this._codeNotesBox);

  Future<List<CodeNote>> getAllCodeNotes() async {
    try {
      return _codeNotesBox.values.toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<CodeNote>> searchCodeNotesByName(String name) async {
    try {
      return _codeNotesBox.values
          .where((note) =>
              note.title == name) // Access the title property of CodeNote model
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> createCodeNote(CodeNote note) async {
    // Change the parameter type to CodeNote
    try {
      await _codeNotesBox.add(note);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateCodeNote(int id, CodeNote updatedNote) async {
    // Change the parameter type to CodeNote
    try {
      await _codeNotesBox.put(id, updatedNote);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteCodeNoteById(int id) async {
    try {
      await _codeNotesBox.delete(id);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteAllCodeNotes() async {
    try {
      await _codeNotesBox.clear();
    } catch (e) {
      throw e.toString();
    }
  }
}
