import 'package:cupertino_theme_app/components/custom_cupertino_note_card.dart';
import 'package:cupertino_theme_app/routes/route_names.dart';
import 'package:flutter/cupertino.dart';

class TextNotesPage extends StatefulWidget {
  const TextNotesPage({super.key});

  @override
  State<TextNotesPage> createState() => _TextNotesPageState();
}

class _TextNotesPageState extends State<TextNotesPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            leading: CupertinoNavigationBarBackButton(
              previousPageTitle: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text('Add'),
              onPressed: () {},
            ),
            largeTitle: const Text('Text Notes'),
          ),
          // CupertinoSearchTextField(
          //   placeholder: 'Search',
          //   onChanged: (value) {},
          //   onSubmitted: (value) {},
          // ),
          SliverFillRemaining(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoSearchTextField(
                      backgroundColor: CupertinoColors.tertiarySystemBackground,
                      placeholder: 'Search',
                      onChanged: (value) {},
                      onSubmitted: (value) {},
                    ),
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
                    CupertinoListSection.insetGrouped(
                      header: const Text('Pinned'),
                      children: [
                        // CustomCupertinoNoteCard(
                        //   title: 'Note 1',
                        //   subtitle: 'This is a note',
                        //   leading: const Icon(CupertinoIcons.doc,
                        //       color: CupertinoColors.systemBlue),
                        //   trailing: const CupertinoListTileChevron(),
                        //   onTap: () {},
                        // ),
                        CustomCupertinoNoteCard(
                          title: 'Note 2',
                          subtitle: 'This is a note',
                          // leading: const Icon(CupertinoIcons.doc,
                          //     color: CupertinoColors.systemBlue),
                          // trailing: const Text('Last edited 2 days ago',
                          //     style: TextStyle(
                          //       fontSize: 12.0,
                          //       color: CupertinoColors.systemGrey2,
                          //     )),
                          trailingText: 'Last edited 2 days ago',
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteNames.createEditTextNote);
                          },
                        ),
                      ],
                    ),
                    CupertinoListSection.insetGrouped(
                      header: const Text('Your Notes'),
                      children: [
                        CustomCupertinoNoteCard(
                          title: 'Your Name',
                          subtitle: 'Movie name',
                          // leading: const Icon(CupertinoIcons.doc,
                          //     color: CupertinoColors.systemBlue),
                          trailingText: 'Created 2 days ago',
                          onTap: () {},
                        ),
                        CustomCupertinoNoteCard(
                          title: 'Note 2',
                          subtitle: 'This is a note',
                          // leading: const Icon(CupertinoIcons.doc,
                          //     color: CupertinoColors.systemBlue),
                          trailingText: 'Last edited 2 days ago',
                          onTap: () {},
                        ),
                        CustomCupertinoNoteCard(
                          title: 'Artisocs',
                          subtitle: 'hadof sdfjlkaj',
                          // leading: const Icon(CupertinoIcons.doc,
                          //     color: CupertinoColors.systemBlue),
                          trailingText: 'Last edited 6 days ago',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
