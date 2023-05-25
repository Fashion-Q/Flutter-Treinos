class Teleport {
  final double x;
  final double y;

  Teleport({required this.x, required this.y});

  Map<String, double> toJson() => {
        'x': x,
        'y': y,
      };

  factory Teleport.fromJson(Map<String, double> posicao) =>
      Teleport(x: posicao['x'] ?? 0, y: posicao['y'] ?? 0);
}
