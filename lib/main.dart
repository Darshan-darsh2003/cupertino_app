import 'package:cupertino_theme_app/database/api/code_notes_api.dart';
import 'package:cupertino_theme_app/database/api/text_notes_api.dart';
import 'package:cupertino_theme_app/routes/route_names.dart';
import 'package:cupertino_theme_app/routes/routes.dart';
import 'package:cupertino_theme_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('text_notes');
  await Hive.openBox('code_notes');
  await Hive.openBox<void>('deleted_text_notes');
  await Hive.openBox<void>('deleted_code_notes');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (_) => TextNotesAPI(Hive.box('text_notes'))),
        ChangeNotifierProvider(
            create: (_) => CodeNotesAPI(Hive.box('code_notes'))),
      ],
      child: const CupertinoThemeApp(),
    ),
  );
}

class CupertinoThemeApp extends StatelessWidget {
  const CupertinoThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'CupertinoTheme App',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Provider.of<ThemeProvider>(context).currentBrightness,
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      initialRoute: RouteNames.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
