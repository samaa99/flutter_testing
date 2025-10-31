# Testing App

A Flutter project created for learning app testing following the [Flutter Testing Codelab](https://codelabs.developers.google.com/codelabs/flutter-app-testing#0).

## Overview

This app demonstrates various testing techniques in Flutter, including:
- Unit tests
- Widget tests
- Integration tests
- Performance testing

## Features

- Simple list view with scrollable items
- Favorites functionality
- Navigation between screens
- Performance monitoring for scrolling

## Testing Structure

### Unit Tests
- `test/models/favorites_test.dart` - Tests for the Favorites model

### Widget Tests
- `test/screens/home_test.dart` - Tests for the home screen ListView and scrolling functionality
- `test/screens/favorites_test.dart` - Tests for the favorites screen

### Integration Tests
- `integration_test/app_test.dart` - End-to-end app testing
- `integration_test/perf_test.dart` - Performance testing for scrolling

### Performance Testing
- `test_driver/perf_driver.dart` - Driver for collecting performance metrics

## Running Tests

### Unit and Widget Tests
```bash
flutter test
```

### Integration Tests
```bash
flutter test integration_test/
```

### Performance Tests
```bash
flutter test integration_test/perf_test.dart
```

## Learning Objectives

This project covers:
1. Writing effective unit tests for data models
2. Testing widget behavior and interactions
3. Simulating user gestures (scrolling, tapping)
4. Measuring app performance
5. Understanding test structure and organization

## Getting Started

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter test` to execute all tests
4. Run `flutter run` to launch the app

## Dependencies

- `flutter_test` - Testing framework
- `integration_test` - Integration testing
- `provider` - State management
- `go_router` - Navigation

Based on the Flutter Testing Codelab tutorial for learning testing best practices in Flutter development.
