class CategoryModel {
  int? statusCode;
  bool? success;
  String? message;
  List<CategoryItem>? data;

  CategoryModel({this.statusCode, this.success, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryItem>[];
      json['data'].forEach((v) {
        data!.add(CategoryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryItem {
  int? id;
  String? uniqueCode;
  String? name;
  String? slug;
  int? status;
  int? displayStatus;
  int? priorityStatus;
  String? fileName;
  String? filePath;
  String? createdAt;
  String? updatedAt;

  CategoryItem(
      {this.id,
        this.uniqueCode,
        this.name,
        this.slug,
        this.status,
        this.displayStatus,
        this.priorityStatus,
        this.fileName,
        this.filePath,
        this.createdAt,
        this.updatedAt});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniqueCode = json['unique_code'];
    name = json['name'];
    slug = json['slug'];
    status = json['status'];
    displayStatus = json['display_status'];
    priorityStatus = json['priority_status'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unique_code'] = uniqueCode;
    data['name'] = name;
    data['slug'] = slug;
    data['status'] = status;
    data['display_status'] = displayStatus;
    data['priority_status'] = priorityStatus;
    data['file_name'] = fileName;
    data['file_path'] = filePath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
