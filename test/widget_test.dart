import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_presentation/main.dart'; 

void main() {
  testWidgets('Attendance screen loads correctly',
      (WidgetTester tester) async {

    // Build the app
    await tester.pumpWidget(const DataTableDemoApp());

    // Verify AppBar title
    expect(find.text('Student Attendance'), findsOneWidget);

    // Verify column headers exist
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Course'), findsOneWidget);
    expect(find.text('Attendance'), findsOneWidget);

    // Verify student data appears
    expect(find.text('Alice'), findsOneWidget);
    expect(find.text('Brian'), findsOneWidget);
    expect(find.text('Cynthia'), findsOneWidget);
  });

  testWidgets('Switch toggles border setting',
      (WidgetTester tester) async {

    await tester.pumpWidget(const DataTableDemoApp());

    // Find the switch
    final switchFinder = find.byType(Switch);

    expect(switchFinder, findsOneWidget);

    // Tap the switch
    await tester.tap(switchFinder);
    await tester.pump();

    // After tapping, border should be enabled
    final dataTable =
        tester.widget<DataTable>(find.byType(DataTable));

    expect(dataTable.border, isNotNull);
  });

  testWidgets('Row selection works',
      (WidgetTester tester) async {

    await tester.pumpWidget(const DataTableDemoApp());

    // Tap on Alice row
    await tester.tap(find.text('Alice'));
    await tester.pump();

    // Verify that DataTable still exists
    expect(find.byType(DataTable), findsOneWidget);
  });
}
