import 'package:cupertino_theme_app/components/notes_layout.dart';
import 'package:flutter/cupertino.dart';

class CodeNotesPage extends StatefulWidget {
  const CodeNotesPage({super.key});

  @override
  State<CodeNotesPage> createState() => CodeNotesPageState();
}

class CodeNotesPageState extends State<CodeNotesPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: MyNotesLayout(
      pageTitle: 'Code Notes',
      trailingButtonText: 'Add',
      onTrailingButtonPressed: () {},
      onSearchSubmitted: (value) {},
      children: [
        CupertinoListSection.insetGrouped(
          header: const Text('Pinned'),
          children: [
            // CustomCupertinoNoteCard(
            //   title: 'Note 1',
            //   subtitle: 'This is a note',
            //   leading: const Icon(CupertinoIcons.doc,
          ],
        ),
      ],
    ));
  }
}
