import 'sub_category_item.dart';
import 'metadata.dart';

class SubCategory {
  int? results;
  Metadata? metadata;
  List<SubCategoryItem>? data;

  SubCategory({this.results, this.metadata, this.data});

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    results: json['results'] as int?,
    metadata: json['metadata'] == null
        ? null
        : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => SubCategoryItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'results': results,
    'metadata': metadata?.toJson(),
    'data': data?.map((e) => e.toJson()).toList(),
  };
}
