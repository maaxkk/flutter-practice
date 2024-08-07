import 'dart:convert';
import 'dart:io';

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = 'f3c5c74288d2a22f02dc447ac6c1a79b';

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken();
    final validatedToken = await _validateUser(
      username: username,
      password: password,
      requestToken: token,
    );
    final sessionId = await _makeSession(requestToken: validatedToken);
    print('sessionId is $sessionId');
    return sessionId;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    }
    return uri;
  }

  Future<String> _makeToken() async {
    final url = _makeUri(
        '/authentication/token/new', <String, dynamic>{'api_key': _apiKey});
    final request = await _client.getUrl(url);
    final response = await request.close();
    var someValue;
    final json = response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) {
          someValue = jsonDecode(v) as Map<String, dynamic>;
          print('first token is');
          print(someValue['request_token']);
          return someValue; // return promise or future
    });
    final token =  (await json)['request_token'] as String;
    return token;
  }

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    final url = _makeUri('/authentication/token/validate_with_login',
        <String, dynamic>{'api_key': _apiKey});
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken,
    };
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    final token = json['request_token'];
    return token;
  }

  Future<String> _makeSession({required String requestToken}) async {
    final url = Uri.parse('$_host/authentication/session/new?api_key=$_apiKey');
    final parameters = <String, dynamic>{
      'request_token': requestToken,
    };
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    // final json = await response
    //     .transform(utf8.decoder)
    //     .toList()
    //     .then((value) => value.join())
    //     .then((v) => jsonDecode(v) as Map<String, dynamic>);
    final sessionId = json['session_id'];
    return sessionId;
  }
}

// anonymous extension
// extension on HttpClientResponse {
// named extension
extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return this
        .transform(utf8.decoder) // refers to HttpClientResponse
        .toList()
        .then((value) => value.join())
        .then((v) => json.decode(v) as Map<String, dynamic>);
  }
}
