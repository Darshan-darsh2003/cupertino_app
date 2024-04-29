import 'package:cupertino_theme_app/components/notes_layout.dart';
import 'package:flutter/cupertino.dart';

class DeletedNotesPage extends StatefulWidget {
  const DeletedNotesPage({super.key});

  @override
  State<DeletedNotesPage> createState() => _DeletedNotesPageState();
}

class _DeletedNotesPageState extends State<DeletedNotesPage> {
  int _selectedDeletePage = 0;

  List DeletePages = [
    {'label': 'Text Notes', 'value': '0'},
    {'label': 'Code Notes', 'value': '1'},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: MyNotesLayout(
      pageTitle: 'Deleted Notes',
      trailingButtonText: 'Delete all',
      trailingTextColor: CupertinoColors.destructiveRed,
      onTrailingButtonPressed: () {},
      onSearchSubmitted: (value) {},
      // additionalFixedWidget: CupertinoSlidingSegmentedControl<String>(
      //     backgroundColor: CupertinoColors.systemGrey2,
      //     thumbColor: DeletePages[_selectedDeletePage]!,
      //     // This represents the currently selected segmented control.
      //     groupValue: _selectedDeletePage,
      //     // Callback that sets the selected segmented control.
      //     onValueChanged: (value) {
      //       if (value != null) {
      //         setState(() {
      //           _selectedDeletePage = value;
      //         });
      //       }
      //     },
      //     children:
      //   ),
      additionalFixedWidget: CupertinoSlidingSegmentedControl(
        padding: const EdgeInsets.all(10.0),
        groupValue: _selectedDeletePage,
        onValueChanged: (value) {
          if (value != null) {
            setState(() {
              print("the value is $value");
              _selectedDeletePage = value;
            });
          }
        },
        children: {
          0: Text('Text Notes'),
          1: Text('Code Notes'),
        },
      ),
      children: [
        // CupertinoListSection.insetGrouped(
        //   children: [
        //     // CustomCupertinoNoteCard(
        //     //   title: 'Note 1',
        //     //   subtitle: 'This is a note',
        //     //   leading: const Icon(CupertinoIcons.doc,
        //   ],
        // ),
      ],
    ));
  }
}
