import 'package:calory_tool/core/providers/theme_notifier.dart';
import 'package:calory_tool/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {
    context.read<ThemeNotifier>().updateSystemThemeMode();

    super.didChangePlatformBrightness();
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme.theme.getThemeData(false),
      darkTheme: themeNotifier.currentTheme.theme.getThemeData(true),
      themeMode: themeNotifier.currentThemeMode,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, child) {
        return OKToast(child: child!);
      },
    );
  }
}
