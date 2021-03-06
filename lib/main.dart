import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tarotcardapp/src/providers/all_deck.dart';
import 'package:tarotcardapp/src/providers/interstitial_counter.dart';

import 'src/pages/home_page.dart';
import 'src/providers/current_index.dart';

// INTERNACIONALIZATION
import 'package:tarotcardapp/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrentIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AllDeck(),
        ),
        ChangeNotifierProvider(
          create: (_) => InterstitialCounter(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
      },
      title: 'Material App',
      home: HomePage(),
      // PlanetarySpreadPage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
