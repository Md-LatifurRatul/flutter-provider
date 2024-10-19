import 'package:intl/intl.dart';

Future<String> getProfileUserName() async {
  await Future.delayed(Duration(seconds: 5));

  return 'Rtl Rahman';
}

Future<String> getCurrentTime() async {
  try {
    await Future.delayed(Duration(seconds: 5));
    print("Fetching current time...");
    // return DateTime.now().toString();
    return DateFormat('yMMMd').format(DateTime.now());
  } catch (e) {
    print("Error occurred: $e");
    throw Exception('Error getting current time');
  }
}

Stream<int> getSessionTime() {
  return Stream.periodic(
    Duration(seconds: 1),
    (sessionTime) => sessionTime++,
  );
}
