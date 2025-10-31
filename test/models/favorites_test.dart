import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  group('Testing App Provider', () {

    var favorites = Favorites();

    test('A new item should be added', () {
      // Arrange
      final itemNumber = 1;

      // Assert
      favorites.add(itemNumber);

      // Act
      expect(favorites.items.contains(itemNumber), true);
    });


    test('An item should be removed', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}