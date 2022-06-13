class ConnectionException implements Exception {
  final String message =
      'Seems like you are openning the app for the first time and unfortunately you are  not connected to the internet.';

  const ConnectionException();

  @override
  String toString() => message;
}

class ReloadException implements Exception {
  final String message =
      'Seems like you are trying to reload the data but unfortunately you are not connected to the internet.';

  const ReloadException();

  @override
  String toString() => message;
}
