import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('App shows title and initial turn', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // App bar title.
    expect(find.text('TIC TAC TOE'), findsOneWidget);

    // Status card should show initial turn is X.
    expect(find.text('TURN: X'), findsOneWidget);

    // Two turn pills should exist.
    expect(find.text('X'), findsWidgets);
    expect(find.text('O'), findsWidgets);
  });

  testWidgets('Tapping a tile places X then O', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Tap first empty tile -> should place X.
    // We find an InkWell tile by tapping the first one in the grid.
    final Finder inkwells = find.byType(InkWell);
    expect(inkwells, findsWidgets);

    await tester.tap(inkwells.first);
    await tester.pumpAndSettle();

    // After first move, turn should be O.
    expect(find.text('TURN: O'), findsOneWidget);

    // Tap a different tile -> should place O.
    await tester.tap(inkwells.at(1));
    await tester.pumpAndSettle();

    // After second move, turn should be X.
    expect(find.text('TURN: X'), findsOneWidget);
  });

  testWidgets('New game button exists', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    expect(find.widgetWithText(FilledButton, 'NEW GAME'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'RESET'), findsOneWidget);
  });
}
