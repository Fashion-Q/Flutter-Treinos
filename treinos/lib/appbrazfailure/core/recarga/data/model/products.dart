class ProdutosModel {
  final String id;
  final String name;
  final int amount;
  final int minimumAmount;
  final int maximumAmount;
  final bool fixedAmount;

  const ProdutosModel(
      {required this.id,
      required this.name,
      required this.amount,
      required this.minimumAmount,
      required this.maximumAmount,
      required this.fixedAmount});

  factory ProdutosModel.fromJson(Map<String, dynamic> json) => ProdutosModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        amount: json["amount"] ?? 0,
        minimumAmount: json["mimimum_amount"] ?? 0,
        maximumAmount: json["maximum_amount"] ?? 0,
        fixedAmount: json["fixed_amount"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'amount': amount,
        'minimum_amount': minimumAmount,
        'maximum_amount': maximumAmount,
        'fixed_amount': fixedAmount,
      };
}
