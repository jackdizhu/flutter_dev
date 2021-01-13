// import 'dart:async';
// import 'dart:io';
// import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
// import 'package:path_provider/path_provider.dart';

class HttpUtil {

  Dio dio;

  // 请求服务器地址
  String baseUrl =  '';

  // content-type
  Map contentType = {
    'json': "application/json",
    'form': "application/x-www-form-urlencoded"
  };

  /*
   * config it and create
   */
  HttpUtil() {
    // 初始化 Dio
    dio = new Dio(new BaseOptions(
      baseUrl: baseUrl,        // 请求的baseUrl
      connectTimeout: 30000,    // 连接超时时间
      receiveTimeout: 30000,    // 响应超时时间
      contentType: contentType['json'],
    ));

    // 配置代理
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // client.findProxy = (uri) {
      //   //proxy all request to localhost:8888
      //   return "PROXY localhost:8888";
      // };
    };

    // 请求拦击
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        // 请求拦截
        print('onRequest---- $options');
        return options;
      },
      onResponse: (Response response){
        // 响应拦截
        print('onResponse---- $response');
        return response;
      },
      onError: (DioError err){
        // 错误数据拦截
        print('onError---- $err');
        return err;
      }
    ));
  }

  /*
   * get请求
   */
  get(url, {data, options, cancelToken}) async {
    Response response;
    print('get url---- ${url}');
    try {
      response = await dio.get(url, queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success---- ${response.statusCode}');
      // response.data; 响应体
      // response.headers; 响应头
      // response.request; 请求体
      // response.statusCode; 状态码
    } on DioError catch (e) {
      print('get error---- $e');
    }
    return response.data;
  }

  /*
   * post请求
   */
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url, queryParameters: data, options: options, cancelToken: cancelToken);
      print('post success---- ${response.statusCode}');
    } on DioError catch (e) {
      print('post error---- $e');
    }
    return response.data;
  }
  /*
   * post请求
   */
  postForm(url, {data, options, cancelToken}) async {
    Response response;
    FormData formData = FormData.fromMap(data);
    try {
      response = await dio.post(url, data: formData, options: options, cancelToken: cancelToken);
      print('post success---- ${response.statusCode}');
    } on DioError catch (e) {
      print('post error---- $e');
    }
    return response.data;
  }
}
