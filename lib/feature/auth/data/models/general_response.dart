import 'package:equatable/equatable.dart';

class generalResponse extends Equatable {
  final String? statusMsg;
  final String? message;

  const generalResponse({
    this.statusMsg,
    this.message,
  });

  factory generalResponse.fromJson(Map<String, dynamic> json) {
    return generalResponse(
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusMsg': statusMsg,
        'message': message,
      };

  @override
  List<Object?> get props => [statusMsg, message];
}