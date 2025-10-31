import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/home.dart';

Widget createHomeScreen() =>
    ChangeNotifierProvider<Favorites>(
      create: (_) => Favorites(),
      child: MaterialApp(home: HomePage(),),
    );

void main() {

  group('Home Page Widget Tests', () {
    testWidgets('Testing if ListView shows up', (tester) async {
      // pumpWidget() renders the widget tree in the test environment
      // It's like displaying the widget on a virtual screen for testing
      await tester.pumpWidget(createHomeScreen());
      
      // find.byType(ListView) searches the widget tree for a ListView widget
      // findsOneWidget asserts that exactly one ListView exists in the widget tree
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing Scrolling', (tester) async {
      // Render the home screen widget in the test environment
      await tester.pumpWidget(createHomeScreen());
      
      // Verify initial state: check that "Item 0" is visible on screen
      // findsOneWidget means we expect to find exactly one widget with this text
      expect(find.text('Item 0'), findsOneWidget);
      
      // fling() simulates a fast scroll gesture (like swiping quickly and releasing)
      await tester.fling(
        find.byType(ListView),     // Target widget: finds the ListView to perform the scroll on
        const Offset(0, -200),     // Direction vector: x=0 (no horizontal movement), 
                                   // y=-200 (move UP 200 pixels - negative Y is upward)
        3000,                      // Velocity: speed in pixels per second (3000 = very fast scroll)
      );
      
      // pumpAndSettle() waits for all animations and scrolling to completely finish
      // Without this, the test might check results before the scroll animation completes
      await tester.pumpAndSettle();
      
      // Verify end state: after scrolling up, "Item 0" should no longer be visible
      // findsNothing means we expect zero widgets with this text (it scrolled out of view)
      expect(find.text('Item 0'), findsNothing);
    });


    testWidgets('Testing IconButtons', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Added to favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Removed from favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}