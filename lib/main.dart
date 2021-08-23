import 'package:flutter/material.dart';
import 'package:news_app/Home.dart';
import 'package:news_app/HomeScreenSearch.dart';
import 'package:provider/provider.dart';
import 'Controller/AppProvider.dart';
import 'UserPreferencesData.dart';
import 'l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppProvider provider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (buildContext) {
        return AppProvider();
      },
      builder: (buildContext, widget) {
        provider = Provider.of<AppProvider>(buildContext);
        provider.currentLanguage = UserPreferences.getLanguage();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
          locale: Locale.fromSubtags(languageCode: provider.currentLanguage),
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}
