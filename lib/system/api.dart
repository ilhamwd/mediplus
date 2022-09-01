import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mediplus/components/inherited_api.dart';
import 'package:mediplus/system/classes/model.dart';
import 'package:mediplus/system/config.dart';
import 'package:mediplus/system/enum/request_method.dart';

class Api {
  late BuildContext sharedContext;

  static Api of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedApi>()!.api;

  Future<T> request<T extends Model>({
    required String endpoint,
    required T model,
    Map<String, dynamic> params = const {},
    RequestMethod method = RequestMethod.get,

    // There should be another params here
    // but since this test does not use any request other than get
    // it is not necessary to add params like headers, body, etc.
    //
    // Solusi Digital
    // Flutter Developer Test
  }) async {
    params['apiKey'] = apiKey;

    final stringParams = params
        .map((key, value) => MapEntry(key, "$key=$value"))
        .values
        .join("&");
    final url = Uri.parse("$baseUrl$endpoint?$stringParams");

    try {
      final request = await get(url);
      final data = jsonDecode(request.body);

      return model..fromJson(data);
    } catch (e) {
      ScaffoldMessenger.of(sharedContext).showSnackBar(const SnackBar(
          content: Text("Something went wrong. Please try again later")));
    }

    return model;
  }
}
