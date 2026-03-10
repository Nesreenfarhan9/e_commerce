class VerificationCodeRequest {
  final String code;

  VerificationCodeRequest({required this.code});
  Map<String, dynamic> toJson() => {'resetCode': code};
}
