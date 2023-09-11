// To parse this JSON data, do
//
//     final formFieldData = formFieldDataFromJson(jsonString);

import 'dart:convert';

FormFieldData formFieldDataFromJson(String str) =>
    FormFieldData.fromJson(json.decode(str));

String formFieldDataToJson(FormFieldData data) => json.encode(data.toJson());

class FormFieldData {
  FormFieldData(
    this.isError,
    this.data,
  );

  bool? isError;
  String? data;

  factory FormFieldData.fromJson(Map<String, dynamic> json) => FormFieldData(
        json["isError"] == null ? null : json["isError"],
        json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "isError": isError == null ? null : isError,
        "data": data == null ? null : data,
      };
}
