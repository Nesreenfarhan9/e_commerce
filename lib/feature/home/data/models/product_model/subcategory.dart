class Subcategory {
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'category': category,
    };
  }
}