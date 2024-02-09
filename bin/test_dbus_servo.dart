import 'dart:developer';

import 'src/data_source/dbus_repository.dart';

/// In this example, we will test the running servo motors using the DBus API.

/// The [dataPattern] is a map of plan for  the servo motors.
/// We will use this pattern to test the servo motors.
/// Motors will be throttled for the specified duration one by one base on the pattern.
///
/// change the value of the [dataPattern] to test the servo motors.
const dataPattern = [
  CandyColor.blue,
  CandyColor.yellow,
  CandyColor.green,
  CandyColor.red,
];

/// The duration in seconds to throttle the motor
const int throttleDuration = 1;

Future<void> main(List<String> arguments) async {
  final dBusRepository = dBusRepositoryProvider;

  log('Testing servo motors will be started in 3 seconds');
  log('');

  await Future.delayed(const Duration(seconds: 3));

  try {
    for (var candy in dataPattern) {
      log('Throttling motor for candy $candy');
      final result = await dBusRepository.throttleMotor(
        candy.index,
        duration: throttleDuration,
      );

      if (!result) {
        throw Exception('Failed to start motor $candy');
      }

      log('Motor for candy $candy is throttled ');
    }
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    return;
  }

  log('');
  log('All motors are throttled successfully');
  log('Test is completed');
}

enum CandyColor {
  blue,
  yellow,
  green,
  red,
}
