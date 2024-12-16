import 'dart:convert';
import 'package:edugated/domain/failures/network_failure.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class NetworkRepository implements Network {
  // get put post delete
  // Take a URL string as parameter
  // and return Map<String, dynamic> as json
  // And do exception handling
  Future<Either<NetworkFailure, dynamic>> get(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> postFile(
      String url, Map<String, dynamic> data, Map<String, String> file) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      file.forEach((key, value) async {
        final filePart = await http.MultipartFile.fromPath(key, value);
        request.files.add(filePart);
      });

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      final failure = _handleStatusCode(response.statusCode);

      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  NetworkFailure? _handleStatusCode(int code) {
    if (code == 401) {
      return NetworkFailure(error: 'Unauthorized');
    }
    return null;
  }
}
