import '../network_request.dart';

/// All the api requests must have a [key] which must NOT be the url.
/// Initially check if the response is stored locally
/// If there is an instance of the response check if it falls in the [duration] specified.
/// If it satisfies the condition, return the response without hitting the server.
/// If the condition fails, connect to the server and then repeat 1 and 2.

///This is the core function of the package which works out and returns the appropriate data.
/// [NetworkRequest] object for the get request, which contains a [url] for http API calls and [key] to cache the latest instance.
/// The optional parameter [forceData] is only used for a force in latest data from the remote API.

abstract class Handler {
  final Duration duration;

  Handler(
    this.duration,
  );
  Future<String> get(NetworkRequest request, {bool forceData});
  Future<String> post(NetworkRequest request, String data);
  Future<String> postAndGet(NetworkRequest request, String data);
}
