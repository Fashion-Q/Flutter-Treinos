class ModelTask {
  final int id;
  final String nome;
  final int level;
  final String url;
  final double progress;
  final int indexProgress;

  ModelTask(
      {required this.id,
      required this.nome,
      required this.level,
      required this.url,
      required this.progress,
      required this.indexProgress});

  factory ModelTask.fromJson(Map<String, dynamic> json) {
    return ModelTask(
      id: int.parse(json["id"].toString()),
        nome: json["nome"] ?? "NoName",
        level: int.parse(json["level"].toString()),
        url: json["url"] ??
            "data:image/png;base64,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",
        progress: double.parse(json["progress"].toString()),
        indexProgress: int.parse(json["indexProgress"].toString()));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "level": level,
        "url": url,
        "progress": progress,
        "indexProgress": indexProgress
      };
}
