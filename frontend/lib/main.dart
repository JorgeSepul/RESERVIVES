/// RESERVIVES - Clase principal de la aplicación
library;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:reservives/config/app_routes.dart';
import 'package:reservives/config/app_theme.dart';
import 'package:reservives/l10n/app_localizations.dart';
import 'package:reservives/providers/locale_provider.dart';
import 'package:reservives/providers/theme_provider.dart';
import 'package:reservives/services/push_notifications_service.dart';

import 'dart:html' as html;
import 'package:flutter_web_plugins/url_strategy.dart';

String? extractedMicrosoftToken;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final rawHash = html.window.location.hash;
  if (rawHash.contains('access_token=')) {
    final cleanHash = rawHash.startsWith('#') ? rawHash.substring(1) : rawHash;
    final params = Uri.splitQueryString(cleanHash);
    extractedMicrosoftToken = params['access_token'];
    html.window.history.replaceState(null, 'Reservives', '/');
  }

  usePathUrlStrategy();
  final initialLocale = await loadInitialLocale();
  Intl.defaultLocale = initialLocale.languageCode;
  await initializeDateFormatting(initialLocale.languageCode, null);
  await initializePushNotificationsBootstrap();
  runApp(
    ProviderScope(
      overrides: [
        initialLocaleProvider.overrideWithValue(initialLocale),
      ],
      child: const ReservivesApp(),
    ),
  );
}

class ReservivesApp extends ConsumerWidget {
  const ReservivesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'RESERVIVES',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      routerConfig: router,
    );
  }
}
