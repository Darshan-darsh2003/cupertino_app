import 'package:flutter/cupertino.dart';

class CustomCupertinoNoteCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final String? trailingText;
  final Function onTap;
  final EdgeInsetsGeometry? padding;

  const CustomCupertinoNoteCard({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailingText,
    required this.onTap,
    this.padding = const EdgeInsets.all(15),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          //show context menu
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.pencil),
                          const SizedBox(width: 10),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      isDestructiveAction: true,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.trash,
                              color: CupertinoColors.destructiveRed),
                          const SizedBox(width: 10),
                          Text('Delete'),
                        ],
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.share),
                          const SizedBox(width: 10),
                          Text('Share'),
                        ],
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.info_circle),
                          const SizedBox(width: 10),
                          Text('Info'),
                        ],
                      ),
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                );
              });
        },
        child: CupertinoListTile.notched(
          padding: padding,
          title: Text(title),
          subtitle: subtitle == null ? null : Text(subtitle!),
          leading: leading,
          trailing: Text(trailingText!,
              style: const TextStyle(
                fontSize: 12.0,
                color: CupertinoColors.systemGrey2,
              )),
          onTap: () {
            onTap();
          },
        ));
  }
}
