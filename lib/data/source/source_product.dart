import 'dart:convert';
import 'package:yajaya/config/api.dart';
import 'package:yajaya/config/app_request.dart';

class SourceProduct {
  static Future<int> count() async {
    String url = '${Api.product}/${Api.count}';
    String? responseBody = await AppRequest.gets(url);
    if (responseBody != null) {
      Map result = jsonDecode(responseBody);
      return result['data'];
    }
    return 0;
  }
}
