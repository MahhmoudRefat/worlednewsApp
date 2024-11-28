import 'dart:async';
import 'package:intl/intl.dart';

class DateUpdater {
  Timer? timer;

  /// Updates the date and calls the provided [onUpdate] callback.
  void updateDate(Function(String) onUpdate) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMM d').format(now); // e.g., "Saturday, Aug 5"
    onUpdate(formattedDate); // Notify the caller with the updated date
  }

  /// Schedules a midnight update and calls [onUpdate] when the date changes.
  void scheduleMidnightUpdate(Function(String) onUpdate) {
    // Calculate the time until midnight
    DateTime now = DateTime.now();
    DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1);
    Duration timeUntilMidnight = nextMidnight.difference(now);

    // Schedule a timer to update the date at midnight
    timer = Timer(timeUntilMidnight, () {
      updateDate(onUpdate); // Update the date
      scheduleMidnightUpdate(onUpdate); // Reschedule the timer for the next midnight
    });
  }

  /// Disposes of the timer to clean up resources.
  void dispose() {
    timer?.cancel();
  }
}
