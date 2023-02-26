import 'package:flutter/foundation.dart';

class ErrorModel {
  ErrorModel({this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    try {
      List<String> errorsList = [];
      json.forEach((key, value) {
        if (value is List) {
          for (var element in value) {
            errorsList.add(element);
          }
        }
      });

      errors = errorsList;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  dynamic errors;
  String? message;
}
