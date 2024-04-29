import 'package:cupertino_theme_app/routes/route_names.dart';
import 'package:cupertino_theme_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void toggleTheme({required BuildContext context}) {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('Notes'),
            trailing: CupertinoSwitch(
                activeColor: CupertinoColors.systemBlue,
                value: Provider.of<ThemeProvider>(context).currentBrightness ==
                    Brightness.dark,
                onChanged: (value) {
                  toggleTheme(context: context);
                }),
          ),
          SliverFillRemaining(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CupertinoListSection.insetGrouped(
                  header: const Text('Your Notes'),
                  children: <CupertinoListTile>[
                    CupertinoListTile.notched(
                      title: const Text('Text Notes'),
                      leading: const Icon(CupertinoIcons.doc,
                          color: CupertinoColors.systemBlue),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.textNotes);
                      },
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Code Collection'),
                      leading: const Icon(CupertinoIcons.doc_richtext,
                          color: CupertinoColors.systemGreen),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.codeNotes);
                      },
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Deleted Notes'),
                      leading: const Icon(CupertinoIcons.trash,
                          color: CupertinoColors.systemRed),
                      additionalInfo: const Text('14 notes'),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => {
                        Navigator.pushNamed(
                            context, RouteNames.deletedTextNotes),
                      },
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  header: const Text('Others'),
                  children: <CupertinoListTile>[
                    CupertinoListTile.notched(
                      title: const Text('Settings'),
                      leading: const Icon(
                        CupertinoIcons.settings,
                      ),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => {
                        Navigator.pushNamed(context, RouteNames.settings),
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
