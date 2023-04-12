import 'dart:convert';

import 'package:http/http.dart' as http;

import '../post_model.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<Post?> getPost({required int PostNum}) async {
    String api = "https://jsonplaceholder.typicode.com/posts/$PostNum";
    Uri myUrl = Uri.parse(api);
    http.Response res = await http.get(myUrl);

    if (res.statusCode == 200) {
      String jsonData = res.body;
      Map data = jsonDecode(jsonData);
      Post P = Post.fromMap(data: data);
      return P;
    }
    return null;
  }

  Future<List<Post>?> getAllPost() async {
    String api = "https://jsonplaceholder.typicode.com/posts";
    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      List<dynamic> allData = jsonDecode(res.body);

      List<Post> allPost = allData
          .map(
            (e) => Post.fromMap(data: e),
          )
          .toList();

      return allPost;
    }

    return null;
  }

  Future<Map?> getInfo() async {
    String api = "https://randomuser.me/api/";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);
      return data;
    }
    return null;
  }
}
