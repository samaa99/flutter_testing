import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() {
  // integrationDriver() runs integration tests and handles performance data collection
  // This is the main entry point for performance testing
  return integrationDriver(
    // responseDataCallback is called when the integration test completes
    // It receives performance data collected during the test
    responseDataCallback: (data) async {
      // Check if performance data was actually collected
      if (data != null) {
        // Timeline.fromJson() converts the raw performance data into a Timeline object
        // data['scrolling_summary'] contains timing information about scrolling performance
        // The cast ensures the data is in the expected Map<String, dynamic> format
        final timeline = driver.Timeline.fromJson(
            data['scrolling_summary'] as Map<String, dynamic>);

        // TimelineSummary.summarize() processes the timeline data and calculates
        // performance metrics like frame times, missed frames, etc.
        final summary = driver.TimelineSummary.summarize(timeline);

        // writeTimelineToFile() saves the performance analysis to a file
        await summary.writeTimelineToFile(
          'scrolling_summary',        // Filename for the performance report
          pretty: true,               // Format the JSON output nicely for readability
          includeSummary: true,       // Include summary statistics in the output
        );
      }
    },
  );
}