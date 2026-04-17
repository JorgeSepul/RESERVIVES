library;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFFD23F7A);
  static const Color primaryBlueDark = Color(0xFF9E2A58);
  static const Color primaryBlueLight = Color(0xFFF4A1C0);

  static const Color accentPurple = Color(0xFFB53F7A);
  static const Color accentPurpleDark = Color(0xFF8A2F5D);
  static const Color accentPurpleLight = Color(0xFFE5B5CD);

  static const Color lightBackground = Color(0xFFF6F7FB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF10131A);
  static const Color lightTextSecondary = Color(0xFF667085);
  static const Color lightDivider = Color(0xFFE6E8F0);

  static const Color darkBackground = Color(0xFF090B10);
  static const Color darkSurface = Color(0xFF11141C);
  static const Color darkCard = Color(0xFF151A24);
  static const Color darkText = Color(0xFFF5F7FF);
  static const Color darkTextSecondary = Color(0xFFB0B9CD);
  static const Color darkDivider = Color(0xFF2E3747);

  static const Color success = Color(0xFF2EC48D);
  static const Color warning = Color(0xFFFFB020);
  static const Color error = Color(0xFFFF5D73);
  static const Color info = primaryBlue;

  static const LinearGradient brandGradient = LinearGradient(
    colors: [accentPurple, primaryBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkHeroGradient = LinearGradient(
    colors: [Color(0xFF101522), Color(0xFF0B0E15), Color(0xFF171C2D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightHeroGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF2F4FF), Color(0xFFE9F0FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppRadii {
  static const double s = 10;
  static const double m = 14;
  static const double l = 20;
  static const double xl = 32;
}

class AppShadows {
  static List<BoxShadow> soft(BuildContext context, {double? opacity}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final finalOpacity = opacity ?? (isDark ? 0.25 : 0.08);
    final shadowColor = isDark ? Colors.black : const Color(0xFF10131A);

    return [
      BoxShadow(
        color: shadowColor.withValues(alpha: finalOpacity),
        blurRadius: 24,
        spreadRadius: 0,
        offset: const Offset(0, 8),
      ),
    ];
  }

  static List<BoxShadow> deep(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final shadowColor = isDark ? Colors.black : const Color(0xFF10131A);

    if (isDark) {
      return [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.4),
          blurRadius: 40,
          spreadRadius: -4,
          offset: const Offset(0, 20),
        ),
        BoxShadow(
          color: AppColors.accentPurple.withValues(alpha: 0.05),
          blurRadius: 10,
          spreadRadius: 0,
          offset: const Offset(0, 2),
        ),
      ];
    }

    return [
      BoxShadow(
        color: shadowColor.withValues(alpha: 0.12),
        blurRadius: 40,
        spreadRadius: -5,
        offset: const Offset(0, 25),
      ),
      BoxShadow(
        color: shadowColor.withValues(alpha: 0.03),
        blurRadius: 10,
        spreadRadius: 0,
        offset: const Offset(0, 4),
      ),
    ];
  }
}

class AppTheme {
  static ThemeData get lightTheme {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.accentPurple,
      brightness: Brightness.light,
      primary: AppColors.accentPurple,
      secondary: AppColors.primaryBlue,
      surface: AppColors.lightBackground,
      error: AppColors.error,
    );

    final textTheme = GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.0,
        color: AppColors.lightText,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.8,
        color: AppColors.lightText,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.6,
        color: AppColors.lightText,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: AppColors.lightText,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: AppColors.lightText,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        color: AppColors.lightText,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.2,
        color: AppColors.lightText,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.lightText,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextSecondary,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.lightBackground,
      textTheme: textTheme,
      cardColor: AppColors.lightSurface,
      dividerColor: AppColors.lightDivider,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.black.withValues(alpha: 0.05),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.lightSurface.withValues(alpha: 0.9),
        foregroundColor: AppColors.lightText,
        centerTitle: true,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.m),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF2F2F7),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF8E8E93),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.s),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.s),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.s),
          borderSide: const BorderSide(color: AppColors.accentPurple, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentPurple,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.m),
          ),
          textStyle: textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accentPurple,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.m),
          ),
          side: const BorderSide(color: AppColors.accentPurple),
          textStyle: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.l)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF333333),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.m),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        headerBackgroundColor: Colors.white,
        headerForegroundColor: AppColors.lightText,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        // Estilo del texto "Seleccionar fecha"
        headerHeadlineStyle: textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w800,
          color: AppColors.lightText,
          letterSpacing: -0.5,
        ),
        // Estilo de los botones CANCELAR / ACEPTAR
        confirmButtonStyle: ButtonStyle(
          textStyle: WidgetStateProperty.all(textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          foregroundColor: WidgetStateProperty.all(AppColors.accentPurple),
        ),
        cancelButtonStyle: ButtonStyle(
          textStyle: WidgetStateProperty.all(textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
          foregroundColor: WidgetStateProperty.all(AppColors.lightTextSecondary),
        ),
        dayStyle: textTheme.bodyMedium,
        todayForegroundColor: WidgetStateProperty.all(AppColors.accentPurple),
        todayBackgroundColor: WidgetStateProperty.all(AppColors.accentPurple.withValues(alpha: 0.1)),
        dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.accentPurple;
          return null;
        }),
        dayForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.white;
          if (states.contains(WidgetState.disabled)) return AppColors.lightTextSecondary.withValues(alpha: 0.38);
          return AppColors.lightText;
        }),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        hourMinuteColor: AppColors.lightBackground,
        hourMinuteTextColor: AppColors.accentPurple,
        dialHandColor: AppColors.accentPurple,
        dialBackgroundColor: AppColors.lightBackground,
        entryModeIconColor: AppColors.accentPurple,
        confirmButtonStyle: ButtonStyle(
          textStyle: WidgetStateProperty.all(textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          foregroundColor: WidgetStateProperty.all(AppColors.accentPurple),
        ),
        cancelButtonStyle: ButtonStyle(
          textStyle: WidgetStateProperty.all(textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
          foregroundColor: WidgetStateProperty.all(AppColors.lightTextSecondary),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.accentPurple,
      brightness: Brightness.dark,
      primary: AppColors.accentPurpleLight,
      secondary: AppColors.primaryBlueLight,
      surface: AppColors.darkBackground,
      error: AppColors.error,
    );

    final textTheme = GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.0,
        color: AppColors.darkText,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.8,
        color: AppColors.darkText,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.6,
        color: AppColors.darkText,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: AppColors.darkText,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: AppColors.darkText,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        color: AppColors.darkText,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.2,
        color: AppColors.darkText,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.darkText,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextSecondary,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: textTheme,
      shadowColor: Colors.black.withValues(alpha: 0.8),
      canvasColor: AppColors.darkSurface,
      cardColor: const Color(0xFF1C1C1E),
      dividerColor: AppColors.darkDivider,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.white.withValues(alpha: 0.05),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.darkSurface.withValues(alpha: 0.9),
        foregroundColor: AppColors.darkText,
        centerTitle: true,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1C1C1E),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.m),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1C1C1E),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF98989D),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.s),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.s),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.s),
          borderSide: const BorderSide(color: AppColors.accentPurpleLight, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentPurple,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.m),
          ),
          textStyle: textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accentPurpleLight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.m),
          ),
          side: const BorderSide(color: AppColors.accentPurpleLight),
          textStyle: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF1C1C1E),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.l)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFFE5E5EA),
        contentTextStyle: const TextStyle(color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.m),
        ),
      ),
    );
  }
}
