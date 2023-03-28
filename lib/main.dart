import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/routes/pages.dart';
import 'package:hortifrutti_app/app/routes/routes.dart';
import 'package:intl/intl.dart';

import 'app/core/theme/app_theme.dart';
import 'app/data/provider/api.dart';

void main() {
  Get.put<Api>(Api());

  Intl.defaultLocale = 'pt_BR';

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.Dashboard,
    theme: themeData,
    getPages: AppPages.pages,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: const Locale('pt', 'BR'),
    supportedLocales: const [Locale('pt', 'BR')],
  ));
}
