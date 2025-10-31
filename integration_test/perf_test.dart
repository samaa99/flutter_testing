import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_app/main.dart';

void main() {
  group('Testing App Performance', () {
    // IntegrationTestWidgetsFlutterBinding.ensureInitialized() sets up the binding
    // needed for integration tests that can measure performance
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    
    // framePolicy controls how frames are rendered during tests
    // fullyLive means frames render as they would in a real app (for accurate performance measurement)
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Scrolling test', (tester) async {
      // Launch the full app (not just a widget) for integration testing
      await tester.pumpWidget(const TestingApp());

      // Find the ListView widget that we want to test scrolling performance on
      final listFinder = find.byType(ListView);

      // traceAction() wraps code that we want to measure performance for
      // It records timeline data about frame rendering, GPU usage, etc.
      await binding.traceAction(() async {
        // First fling: scroll UP fast (negative Y direction)
        await tester.fling(listFinder, const Offset(0, -500), 10000);
        // Wait for scroll animation to complete before next action
        await tester.pumpAndSettle();

        // Second fling: scroll DOWN fast (positive Y direction) 
        // This tests performance in both scroll directions
        await tester.fling(listFinder, const Offset(0, 500), 10000);
        // Wait for scroll animation to complete
        await tester.pumpAndSettle();
      }, reportKey: 'scrolling_summary'); // reportKey identifies this data in the performance report
    });
  });
}