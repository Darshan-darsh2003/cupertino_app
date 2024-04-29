import 'package:flutter/cupertino.dart';

class CreateEditTextNote extends StatefulWidget {
  const CreateEditTextNote({super.key});

  @override
  State<CreateEditTextNote> createState() => _CreateEditTextNoteState();
}

class _CreateEditTextNoteState extends State<CreateEditTextNote> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('CreateEditTextNote'),
        ),
        child: Text('CreateEditTextNote'));
  }
}
