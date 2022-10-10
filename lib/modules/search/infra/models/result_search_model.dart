// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String? title;
  final String? content;
  final String? img;
  ResultSearchModel({
    this.title,
    this.content,
    this.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'img': img,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      img: map['img'] != null ? map['img'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
