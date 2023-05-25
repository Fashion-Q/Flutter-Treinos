class PosicaoPlayer {
  final double x;
  final double y;

  PosicaoPlayer({required this.x, required this.y});

  Map<String, double> toJson() => {
        'x': x,
        'y': y,
      };

 factory  PosicaoPlayer.fromJson(Map<String, double> posicao) =>
      PosicaoPlayer(x: posicao['x'] ?? 0, y: posicao['y'] ?? 0);
}
