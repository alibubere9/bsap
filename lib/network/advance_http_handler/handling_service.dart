import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../network_exception.dart';
import 'connection_exception.dart';
import 'connectivity.dart';
import 'interfaces/handler.dart';
import 'network_request.dart';
import 'network_response.dart';

const HEADERS = {'content-type': 'application/json'};

class HandlingService extends Handler {
  final Duration duration;
  final Connectivity _connectivity = Connectivity();
  HandlingService(
    this.duration,
  ) : super(duration);

  Future<bool> get _isConnected => _connectivity.isConnected;

  Future<String> post(NetworkRequest request, String data) async {
    http.Response response;
    if (await _isConnected) {
      response =
          await http.post(Uri.parse(request.url), body: data, headers: HEADERS);
    } else {
      throw ConnectionException();
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw FetchDataException(
          'Invalid Request : ${response.statusCode} : ${response.body}');
    }
  }

  Future<String> postAndGet(NetworkRequest request, String data) async {
    String response;
    try {
      response = await post(request, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<String> get(NetworkRequest request, {bool forceData = false}) async {
    final DateTime lastAcceptableDate = DateTime.now().subtract(duration);
    NetworkResponse response = await _readFromLocal(request.key);
    bool dataExists = response.value != 'NO_DATA';
    String json;
    if (await _isConnected) {
      if (forceData) {
        try {
          json = await _getFromServer(request.url);
        } catch (e) {
          print(e.toString());
          throw e;
        }
        return await _saveOnLocal(json: json, key: request.key);
      }
      if (dataExists) {
        final DateTime lastModified = response.time;
        if (lastModified.isAfter(lastAcceptableDate)) {
          return response.value;
        } else {
          _removeFromLocal(request.key);
          try {
            json = await _getFromServer(request.url);
          } catch (e) {
            throw e;
          }
          return await _saveOnLocal(json: json, key: request.key);
        }
      } else {
        try {
          json = await _getFromServer(request.url);
        } catch (e) {
          return e.toString();
        }
        return await _saveOnLocal(json: json, key: request.key);
      }
    } else {
      if (dataExists) {
        if (forceData) {
          throw const ReloadException();
        }
        return response.value;
      } else {
        throw const ConnectionException();
      }
    }
  }

  Future<String> _getFromServer(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      print(response.statusCode);
      print(response.body);
      throw FetchDataException(
          "Incorrect request ${response.statusCode} : ${response.body}");
    }
  }

  Future<String> _saveOnLocal(
      {required String json, required String key}) async {
    final pref = await SharedPreferences.getInstance();
    final response = NetworkResponse(time: DateTime.now(), value: json);
    String jsonToStore = response.toJson();
    pref.setString(key, jsonToStore);
    return json;
  }

  Future<NetworkResponse> _readFromLocal(String key) async {
    final pref = await SharedPreferences.getInstance();
    String? value = pref.getString(key);
    if (value == null) {
      return NetworkResponse(time: DateTime.now(), value: 'NO_DATA');
    }
    final response = NetworkResponse.fromJson(value);
    return response;
  }

  Future<void> _removeFromLocal(String key) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}
