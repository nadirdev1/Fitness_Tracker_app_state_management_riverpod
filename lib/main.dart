import 'package:fitness_tracker_app_state_management/core/constants.dart';
import 'package:fitness_tracker_app_state_management/providers/onboarding_provider/onboarding_provider.dart';
import 'package:fitness_tracker_app_state_management/screens/workout_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_tracker_app_state_management/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sh = await SharedPreferences.getInstance();
  final bool hasSeenOnboarding = sh.getBool(hasOnboardingInitialized) ?? false;
  runApp(
    ProviderScope(
      overrides: [
        hasSeenOnboardingProvider.overrideWithValue(hasSeenOnboarding),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final hasSeenOnboarding = ref.read(hasSeenOnboardingProvider);
        return MaterialApp(
          title: 'Fitness Tracker',
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: const ColorScheme.dark(
              primary: Colors.white,
              secondary: Colors.white70,
              surface: Color(0xFF1A237E),
              onSurface: Colors.white,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1A237E),
              elevation: 0,
            ),
            scaffoldBackgroundColor: const Color(0xFF0D1344),
            cardTheme: CardThemeData(
              color: const Color(0xFF1A237E),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            tabBarTheme: const TabBarThemeData(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicatorColor: Colors.white,
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF1A237E),
            ),
          ),
          home: hasSeenOnboarding
              ? const WorkoutListScreen()
              : const OnboardingScreen(),
        );
      },
    );
  }
}
