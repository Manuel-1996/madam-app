class ProdottiPopolari {
  final int id_prodotto;
  final String colore;

  ProdottiPopolari({this.id_prodotto, this.colore});

  factory ProdottiPopolari.fromJson(Map<String, dynamic> json) {
    return ProdottiPopolari(
        id_prodotto: json['idArticolo'], colore: json['colore']);
  }
}
