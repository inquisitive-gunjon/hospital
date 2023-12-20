/// title : "This is Hospital"
/// sub_title : "This is Smart Hospital "
/// slug : "smart"
/// description : "This is smart Hospital This system doctor MR Arafat Sorkar"
/// category_id : "10"
/// date : "17/12/2023"
/// tags : "test"

class BlogDataRequestModel {
  BlogDataRequestModel({
      String? title, 
      String? subTitle, 
      String? slug, 
      String? description, 
      String? categoryId, 
      String? date, 
      String? tags,}){
    _title = title;
    _subTitle = subTitle;
    _slug = slug;
    _description = description;
    _categoryId = categoryId;
    _date = date;
    _tags = tags;
}

  BlogDataRequestModel.fromJson(dynamic json) {
    _title = json['title'];
    _subTitle = json['sub_title'];
    _slug = json['slug'];
    _description = json['description'];
    _categoryId = json['category_id'];
    _date = json['date'];
    _tags = json['tags'];
  }
  String? _title;
  String? _subTitle;
  String? _slug;
  String? _description;
  String? _categoryId;
  String? _date;
  String? _tags;
BlogDataRequestModel copyWith({  String? title,
  String? subTitle,
  String? slug,
  String? description,
  String? categoryId,
  String? date,
  String? tags,
}) => BlogDataRequestModel(  title: title ?? _title,
  subTitle: subTitle ?? _subTitle,
  slug: slug ?? _slug,
  description: description ?? _description,
  categoryId: categoryId ?? _categoryId,
  date: date ?? _date,
  tags: tags ?? _tags,
);
  String? get title => _title;
  String? get subTitle => _subTitle;
  String? get slug => _slug;
  String? get description => _description;
  String? get categoryId => _categoryId;
  String? get date => _date;
  String? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['sub_title'] = _subTitle;
    map['slug'] = _slug;
    map['description'] = _description;
    map['category_id'] = _categoryId;
    map['date'] = _date;
    map['tags'] = _tags;
    return map;
  }

}