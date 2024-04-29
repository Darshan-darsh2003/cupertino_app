import 'package:flutter/cupertino.dart';

class MyNotesLayout extends StatefulWidget {
  final String pageTitle;
  final String trailingButtonText;
  final Function onTrailingButtonPressed;
  final Function onSearchSubmitted;
  final Widget? additionalFixedWidget;
  final Color? trailingTextColor;
  final List<Widget> children;

  const MyNotesLayout({
    super.key,
    required this.pageTitle,
    required this.trailingButtonText,
    required this.onTrailingButtonPressed,
    required this.onSearchSubmitted,
    required this.children,
    this.additionalFixedWidget,
    this.trailingTextColor,
  });

  @override
  State<MyNotesLayout> createState() => _MyNotesLayoutState();
}

class _MyNotesLayoutState extends State<MyNotesLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            child: Text(widget.trailingButtonText,
                style: TextStyle(
                  color: widget.trailingTextColor ?? CupertinoColors.systemBlue,
                )),
            onPressed: () {
              widget.onTrailingButtonPressed();
            },
          ),
          largeTitle: Text(widget.pageTitle),
        ),
        SliverFillRemaining(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CupertinoListSection.insetGrouped(
                children: [
                  // CupertinoSearchTextField(
                  //   backgroundColor: CupertinoColors.tertiarySystemBackground,
                  //   placeholder: 'Search',
                  //   onChanged: (value) {},
                  //   onSubmitted: (value) {
                  //     widget.onSearchSubmitted(value);
                  //   },
                  // ),
                  if (widget.additionalFixedWidget != null)
                    widget.additionalFixedWidget!
                  else if (widget.additionalFixedWidget == null)
                    CupertinoSearchTextField(
                      backgroundColor: CupertinoColors.tertiarySystemBackground,
                      placeholder: 'Search',
                      onChanged: (value) {},
                      onSubmitted: (value) {
                        widget.onSearchSubmitted(value);
                      },
                    ),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: widget.children,
              )))
            ],
          ),
        ),
      ],
    );
  }
}
