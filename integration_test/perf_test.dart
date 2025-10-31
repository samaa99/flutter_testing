import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_app/main.dart';

void main() {
  group('Testing App Performance', () {
    // IntegrationTestWidgetsFlutterBinding.ensureInitialized() sets up the binding
    // needed for integration tests
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Scrolling test', (tester) async {
      // Launch the full app (not just a widget) for integration testing
      await tester.pumpWidget(const TestingApp());

      // Find the ListView widget that we want to test scrolling on
      final listFinder = find.byType(ListView);

      // Verify ListView exists
      expect(listFinder, findsOneWidget);

      // Test scrolling functionality without performance tracing
      // First fling: scroll UP fast (negative Y direction)
      await tester.fling(listFinder, const Offset(0, -500), 10000);
      // Wait for scroll animation to complete before next action
      await tester.pumpAndSettle();

      // Second fling: scroll DOWN fast (positive Y direction)
      // This tests scrolling in both directions
      await tester.fling(listFinder, const Offset(0, 500), 10000);
      // Wait for scroll animation to complete
      await tester.pumpAndSettle();
      
      // Verify the ListView is still present after scrolling
      expect(listFinder, findsOneWidget);
    });
  });
}