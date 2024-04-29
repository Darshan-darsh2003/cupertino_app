import 'package:cupertino_theme_app/components/create_update_text_note.dart';
import 'package:cupertino_theme_app/pages/code_notes_page.dart';
import 'package:cupertino_theme_app/pages/deleted_notes_page.dart';
import 'package:cupertino_theme_app/pages/home_page.dart';
import 'package:cupertino_theme_app/pages/settings_page.dart';
import 'package:cupertino_theme_app/pages/text_notes_page.dart';
import 'package:cupertino_theme_app/routes/route_names.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  Routes();

  static CupertinoPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return CupertinoPageRoute(builder: (_) => const HomePage());
      case RouteNames.textNotes:
        return CupertinoPageRoute(builder: (_) => const TextNotesPage());
      case RouteNames.codeNotes:
        return CupertinoPageRoute(builder: (_) => const CodeNotesPage());
      case RouteNames.settings:
        return CupertinoPageRoute(builder: (_) => const SettingsPage());
      case RouteNames.createEditTextNote:
        return CupertinoPageRoute(builder: (_) => CreateEditTextNote());
      // case RouteNames.createUpdateCodeNote:
      //   return CupertinoPageRoute(builder: (_) => const CreateUpdateCodeNote());
      case RouteNames.deletedTextNotes:
        return CupertinoPageRoute(builder: (_) => const DeletedNotesPage());
      default:
        return CupertinoPageRoute(builder: (_) => const HomePage());
    }
  }
}
