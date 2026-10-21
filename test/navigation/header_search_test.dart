import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _app(PreferredSizeWidget header) {
  return BlocProvider<TThemeManager>(
    create: (_) => TThemeManager(),
    child: MaterialApp(
      home: Scaffold(appBar: header),
    ),
  );
}

Finder get _clearButton => find.descendant(
      of: find.byType(THeader),
      matching: find.byType(IconButton),
    );

BoxDecoration _searchFieldDecoration(WidgetTester tester) {
  final container = tester.widget<Container>(
    find.byKey(const ValueKey('theader-search-field')),
  );
  return container.decoration! as BoxDecoration;
}

void main() {
  group('THeader.search', () {
    testWidgets('clear button fires onChanged with empty string once',
        (tester) async {
      final changes = <String>[];
      var clearedCount = 0;

      await tester.pumpWidget(
        _app(
          THeader.search(
            hintText: 'Cari',
            onChanged: changes.add,
            onCleared: () => clearedCount++,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Yogyakarta');
      await tester.pump();
      expect(_clearButton, findsOneWidget);

      changes.clear();
      await tester.tap(_clearButton);
      await tester.pump();

      expect(changes, ['']);
      expect(clearedCount, 1);
      expect(tester.widget<TextField>(find.byType(TextField)).controller?.text,
          isEmpty);
      expect(_clearButton, findsNothing);
    });

    testWidgets('autofocus focuses the field when opened', (tester) async {
      await tester.pumpWidget(
        _app(const THeader.search(searchAutofocus: true)),
      );
      await tester.pump();

      final editable = tester.widget<EditableText>(find.byType(EditableText));
      expect(editable.focusNode.hasFocus, isTrue);
    });

    testWidgets('searchInitialText fills the field and shows clear button',
        (tester) async {
      await tester.pumpWidget(
        _app(const THeader.search(searchInitialText: 'Yogyakarta')),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, 'Yogyakarta');
      expect(_clearButton, findsOneWidget);
    });

    testWidgets('external controller is not disposed by the header',
        (tester) async {
      final controller = TextEditingController(text: 'Kata kunci');

      await tester.pumpWidget(
        _app(THeader.search(searchController: controller)),
      );

      expect(find.text('Kata kunci'), findsOneWidget);
      expect(_clearButton, findsOneWidget);

      await tester.pumpWidget(const SizedBox());
      await tester.pump();

      expect(controller.text, 'Kata kunci');
      expect(() => controller.text = 'still usable', returnsNormally);
      controller.dispose();
    });

    testWidgets('external controller replaces and updates the field',
        (tester) async {
      final first = TextEditingController(text: 'first');
      final second = TextEditingController(text: 'second');

      await tester.pumpWidget(
        _app(THeader.search(searchController: first)),
      );
      expect(find.text('first'), findsOneWidget);

      await tester.pumpWidget(
        _app(THeader.search(searchController: second)),
      );
      expect(find.text('second'), findsOneWidget);

      first.dispose();
      second.dispose();
    });

    testWidgets('keeps previous behaviour when no optional params are passed',
        (tester) async {
      await tester.pumpWidget(_app(const THeader.search(hintText: 'Cari')));

      expect(find.text('Cari'), findsOneWidget);
      expect(_clearButton, findsNothing);

      await tester.enterText(find.byType(TextField), 'abc');
      await tester.pump();
      expect(_clearButton, findsOneWidget);
    });

    testWidgets('keeps the accent background without a border by default',
        (tester) async {
      await tester.pumpWidget(_app(const THeader.search(hintText: 'Cari')));

      final decoration = _searchFieldDecoration(tester);
      expect(decoration.color, TTheme.light().accent);
      expect(decoration.border, isNull);
      expect(decoration.borderRadius, BorderRadius.circular(8));
    });

    testWidgets('border colour switches the field to the background colour',
        (tester) async {
      final borderColor = TTheme.light().border;

      await tester.pumpWidget(
        _app(THeader.search(searchFieldBorderColor: borderColor)),
      );

      final decoration = _searchFieldDecoration(tester);
      expect(decoration.color, TTheme.light().background);
      expect(decoration.border, Border.all(color: borderColor));
    });

    testWidgets('searchFieldBackgroundColor overrides the field background',
        (tester) async {
      await tester.pumpWidget(
        _app(
          THeader.search(
            searchFieldBorderColor: TTheme.light().border,
            searchFieldBackgroundColor: Colors.red,
          ),
        ),
      );

      expect(_searchFieldDecoration(tester).color, Colors.red);
    });
  });
}
