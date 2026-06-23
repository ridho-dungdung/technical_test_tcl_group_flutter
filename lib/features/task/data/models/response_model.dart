import 'package:test_tcl_group/features/task/domain/entities/response_entitie.dart';

class ResponseModel extends Response {
  const ResponseModel({
    required super.data,
    required super.message,
    required super.success
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      data: json['data'] ?? {},
      message: json['message'] ?? '',
      success: json['success'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'data': data, 'message': message, 'success': success};
}

class ResponsesModel extends Responses {
  const ResponsesModel({
    required super.data,
    required super.message,
    required super.success
  });

  factory ResponsesModel.fromJson(Map<String, dynamic> json) {
    return ResponsesModel(
      data: json['data'] ?? '',
      message: json['message'] ?? '',
      success: json['success'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'data': data, 'message': message, 'success': success};
}