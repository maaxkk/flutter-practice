import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:second_app/domain/entity/post.dart';

class ApiClient {
  final client = HttpClient();
  final queryParams = <String, dynamic>{
    '_limit': '10'
  };

  Future<List<Post>> getPosts() async {
    final url = Uri(
        scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts', queryParameters: queryParams);
    final json = await get(url) as List<dynamic>;
    final posts =
        json.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    return posts;
  }

  Future<dynamic> get(Uri url) async {
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    return json;
  }

  Future<Post?> createPost(
      {required String title, required String body}) async {
    final url = Uri(
        scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts');
    final parameters = <String,dynamic> {
      'title': title,
      'body': body,
      'userId': 109,
    };
    final request = await client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString) as Map<String, dynamic>;
    final post = Post.fromJson(json);
    print(post);
    return post;
  }

  // File upload example
  Future<void> fileUpload(File file) async {
    final url = Uri.parse('example.com');

    final request = await client.postUrl(url);

    request.headers.set(HttpHeaders.contentTypeHeader, ContentType.binary);
    request.headers.add('filename', basename(file.path));
    request.contentLength = file.lengthSync();
    final fileStream = file.openRead();
    await request.addStream(fileStream);

    final httpResponse = await request.close();

    if (httpResponse.statusCode != 200) {
      throw Exception('Error uploading file');
    } else {
      return;
    }
  }

}
