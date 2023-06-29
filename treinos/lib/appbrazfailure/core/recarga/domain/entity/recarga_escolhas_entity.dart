class RecargaEscolhasEntity {
  final String telefone;
  final int valor;
  final String idProduto;

  RecargaEscolhasEntity(
      {required this.telefone, required this.valor, required this.idProduto});

  factory RecargaEscolhasEntity.fromJson(Map<String, dynamic> json) =>
      RecargaEscolhasEntity(
        telefone: json['phone'] ?? "",
        valor: json["amount"] ?? 0,
        idProduto: json["productId"] ?? "",
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = telefone
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '')
        .replaceAll(' ', '');
    map['amount'] = valor;
    map['productId'] = idProduto;
    return map;
  }

  RecargaEscolhasEntity copyWith(
      {String? telefone, int? valor, String? idProduto}) {
    return RecargaEscolhasEntity(
      telefone: telefone ?? this.telefone,
      valor: valor ?? this.valor,
      idProduto: idProduto ?? this.idProduto,
    );
  }
}
