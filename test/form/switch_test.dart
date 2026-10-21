import 'dart:ui' show Tristate;

import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

const _trackKey = ValueKey('tswitch-compact-track');
const _thumbKey = ValueKey('tswitch-compact-thumb');

Widget _app(Widget child, {TThemeManager? manager}) {
  return BlocProvider<TThemeManager>(
    create: (_) => manager ?? TThemeManager(),
    child: MaterialApp(
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

BoxDecoration _decorationOf(WidgetTester tester, Key key) {
  final container = tester.widget<AnimatedContainer>(find.byKey(key));
  return container.decoration! as BoxDecoration;
}

void main() {
  group('TSwitch compact', () {
    testWidgets('renders only the switch and toggles without text',
        (tester) async {
      bool? changed;

      await tester.pumpWidget(
        _app(TSwitch(value: false, onChanged: (value) => changed = value)),
      );

      expect(find.byType(Switch), findsNothing);
      expect(find.byKey(_trackKey), findsOneWidget);
      expect(find.byType(Text), findsNothing);

      await tester.tap(find.byType(TSwitch));
      expect(changed, isTrue);
    });

    testWidgets('uses 42x24 by default and respects width/height overrides',
        (tester) async {
      await tester.pumpWidget(
        _app(TSwitch(value: true, onChanged: (_) {})),
      );

      expect(tester.getSize(find.byKey(_trackKey)), const Size(42, 24));
      expect(tester.getSize(find.byKey(_thumbKey)), const Size(16, 16));

      await tester.pumpWidget(
        _app(TSwitch(value: true, width: 50, height: 30, onChanged: (_) {})),
      );
      await tester.pumpAndSettle();

      expect(tester.getSize(find.byKey(_trackKey)), const Size(50, 30));
      expect(tester.getSize(find.byKey(_thumbKey)), const Size(22, 22));
    });

    testWidgets('tracks theme tokens in light and dark mode', (tester) async {
      await tester.pumpWidget(
        _app(TSwitch(value: true, onChanged: (_) {})),
      );

      expect(_decorationOf(tester, _trackKey).color, TTheme.light().primary);
      expect(_decorationOf(tester, _thumbKey).color, HexColor(gray050));

      await tester.pumpWidget(
        _app(TSwitch(value: false, onChanged: (_) {})),
      );
      await tester.pumpAndSettle();

      expect(_decorationOf(tester, _trackKey).color, TTheme.light().background);
      expect(_decorationOf(tester, _trackKey).border, isNotNull);
      expect(_decorationOf(tester, _thumbKey).color, TTheme.light().border);

      final manager = TThemeManager()..toggleTheme(true);
      await tester.pumpWidget(
        _app(TSwitch(value: true, onChanged: (_) {}), manager: manager),
      );
      await tester.pumpAndSettle();

      expect(_decorationOf(tester, _trackKey).color, TTheme.dark().primary);
    });

    testWidgets('isError uses the destructive track colour', (tester) async {
      await tester.pumpWidget(
        _app(TSwitch(value: true, isError: true, onChanged: (_) {})),
      );

      expect(
          _decorationOf(tester, _trackKey).color, TTheme.light().destructive);
    });

    testWidgets('disabled state does not toggle and is dimmed', (tester) async {
      var calls = 0;
      await tester.pumpWidget(
        _app(
          TSwitch(value: false, isEnabled: false, onChanged: (_) => calls++),
        ),
      );

      await tester.tap(find.byType(TSwitch));
      expect(calls, 0);

      final opacity = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(TSwitch),
          matching: find.byType(Opacity),
        ),
      );
      expect(opacity.opacity, 0.5);

      final node = tester.getSemantics(find.byType(TSwitch));
      expect(node.flagsCollection.isEnabled, Tristate.isFalse);
    });

    testWidgets('exposes toggled semantics', (tester) async {
      await tester.pumpWidget(
        _app(TSwitch(value: true, onChanged: (_) {})),
      );

      final node = tester.getSemantics(find.byType(TSwitch));
      expect(node.flagsCollection.isToggled, Tristate.isTrue);
    });

    testWidgets('lockWhenEnabled prevents turning the switch off',
        (tester) async {
      var calls = 0;

      await tester.pumpWidget(
        _app(
          TSwitch(
            value: true,
            lockWhenEnabled: true,
            onChanged: (_) => calls++,
          ),
        ),
      );

      await tester.tap(find.byType(TSwitch));
      expect(calls, 0);
    });

    testWidgets('shows an error message below the compact switch',
        (tester) async {
      await tester.pumpWidget(
        _app(TSwitch(value: false, error: 'Wajib aktif', onChanged: (_) {})),
      );

      expect(find.byKey(_trackKey), findsOneWidget);
      expect(find.text('Wajib aktif'), findsOneWidget);
    });
  });

  group('TSwitch labelled', () {
    testWidgets('keeps the previous layout and behaviour', (tester) async {
      bool? changed;
      await tester.pumpWidget(
        _app(
          TSwitch(
            label: 'Label',
            description: 'Description',
            value: false,
            onChanged: (value) => changed = value,
          ),
        ),
      );

      expect(find.byType(Switch), findsOneWidget);
      expect(find.text('Label'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.byKey(_trackKey), findsNothing);

      await tester.tap(find.byType(Switch));
      expect(changed, isTrue);
    });

    testWidgets('description is optional', (tester) async {
      await tester.pumpWidget(
        _app(
          TSwitch(label: 'Label', value: false, onChanged: (_) {}),
        ),
      );

      expect(find.text('Label'), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(TSwitch),
          matching: find.byType(Text),
        ),
        findsOneWidget,
      );
      expect(find.byType(Switch), findsOneWidget);
    });
  });
}
