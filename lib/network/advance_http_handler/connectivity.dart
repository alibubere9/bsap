import 'dart:io';
import 'package:http/http.dart' as http;

class Connectivity {
  Future<bool> get isConnected => _hasConnection();
  Future<bool> _hasConnection() async {
    try {
      await http.get(Uri.parse('https://google.com'));
    } on SocketException {
      return false;
    }
    return true;
  }
}
