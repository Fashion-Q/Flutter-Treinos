class PixQrModel {
  final String copyNPaste;
  final String qrCodeBase64;

  PixQrModel({required this.copyNPaste, required this.qrCodeBase64});
  factory PixQrModel.fromJson(Map<String, dynamic> json) => PixQrModel(
        copyNPaste: json["copy_n_paste"] ?? "",
        qrCodeBase64: json["qr_code_base64"] ?? "",
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['copy_n_paste'] = copyNPaste;
    map['qr_code_base64'] = qrCodeBase64;
    return map;
  }

  //empty
  static PixQrModel empty() {
    return PixQrModel(
      copyNPaste: "",
      qrCodeBase64: "",
    );
  }
}
