class NegoziPopolari {
  final int id_negozio;
  final String nome_negozio;

  NegoziPopolari({this.id_negozio, this.nome_negozio});

  factory NegoziPopolari.fromJson(Map<String, dynamic> json) {
    return NegoziPopolari(
        id_negozio: json['IdNegozio'], nome_negozio: json['NomeNegozio']);
  }
}
