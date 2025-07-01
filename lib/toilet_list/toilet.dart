class Toilet {
  final String? type;
  final String? statut;
  final String? adresse;
  final String? arrondissement;
  final String? horaire;
  final String? accesPmr;
  final String? relaisBebe;
  final String? urlFicheEquipement;

  Toilet({
    this.type,
    this.statut,
    this.adresse,
    this.arrondissement,
    this.horaire,
    this.accesPmr,
    this.relaisBebe,
    this.urlFicheEquipement
  });

  static Toilet fromJson(Map<String, dynamic> json) {
    return Toilet(
        type: json['type'],
        statut: json['statut'],
        adresse: json['adresse'],
        arrondissement: json['arrondissement'],
        horaire: json['horaire'],
        accesPmr: json['acces_pmr'],
        relaisBebe: json['relais_bebe'],
        urlFicheEquipement: json['url_fiche_equipement']
    );
  }
}