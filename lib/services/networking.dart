import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(Uri.parse(url));
    print(response.body);
    return jsonDecode(response.body);
  }
}
