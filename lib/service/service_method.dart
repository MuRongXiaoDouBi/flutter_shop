import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

enum MethodType { GET, POST }

// MethodType.values = List<MethodType>[]

Future getHomePageContent() async {
  var response;
  try {
    response = await request('homePageContext', method: 'POST');
    return response;
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

Future getHomePageBelowConten({formData}) async {
  var response;
  try {
    response = await request('homePageBelowConten', method: 'POST', formData: formData);
    return response;
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

Future getCategory() async {
  var response;
  try {
    response = await request('getCategory', method: 'POST');
    return response;
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

Future request(String url, {String method, formData}) async {
  try {
    print('开始获取数据...............');
    Response response;
    Dio dio = new Dio(BaseOptions(
        method: method,
        contentType: Headers.formUrlEncodedContentType,
        connectTimeout: 5000));
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
