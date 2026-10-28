import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websiteportfilio/app.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> pumpApp(WidgetTester tester, Map<String, Object> values) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1280, 900);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);
    SharedPreferences.setMockInitialValues(values);
    final preferences = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(preferences)],
        child: const PortfolioApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
  }

  testWidgets('shows the English home page', (tester) async {
    await pumpApp(tester, {'locale': 'en'});

    expect(find.text('Iheb Meftah'), findsWidgets);
    expect(find.text('Work'), findsOneWidget);
    expect(find.text('Flutter mobile engineer'), findsOneWidget);
  });

  testWidgets('shows the German navigation', (tester) async {
    await pumpApp(tester, {'locale': 'de'});

    expect(find.text('Werdegang'), findsOneWidget);
    expect(find.text('Projekte'), findsOneWidget);
    expect(find.text('Kontakt'), findsOneWidget);
  });

  testWidgets('opens the projects page', (tester) async {
    await pumpApp(tester, {'locale': 'en'});

    await tester.tap(find.text('Projects'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Sip & Sync POS'), findsOneWidget);
  });

  testWidgets('asks for a language, then shows French', (tester) async {
    await pumpApp(tester, {});

    expect(find.text('Choose your language'), findsOneWidget);
    expect(find.text('Français'), findsOneWidget);

    await tester.tap(find.text('Français'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Choose your language'), findsNothing);
    expect(find.text('Parcours'), findsOneWidget);
    expect(find.text('Ingénieur mobile Flutter'), findsOneWidget);
  });

  testWidgets('switches the about text to software engineer', (tester) async {
    await pumpApp(tester, {'locale': 'en'});

    expect(find.text('Flutter mobile engineer'), findsOneWidget);
    expect(find.text('June 2022 – August 2022'), findsNothing);

    await tester.tap(find.text('Work'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(
      find.text('Flutter Intern', skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.text('June 2022 – August 2022', skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.text('Flutter Developer (Part-time)', skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.text(
        'Flutter Lead (Full-time)',
        skipOffstage: false,
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Software engineer'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Java', skipOffstage: false), findsOneWidget);
    expect(
      find.textContaining('system design', skipOffstage: false),
      findsWidgets,
    );
  });
}
