import 'package:flutter/material.dart';
import 'package:where_toilet/toilet_list/toilet.dart';

class FavoriteService {
  static List<Toilet> _favoriteToilets = [];
  static final _favoriteToiletsNotifier = ValueNotifier<List<Toilet>>(_favoriteToilets);

  static List<Toilet> get favoriteToilets => _favoriteToilets;
  static ValueNotifier<List<Toilet>> get favoriteToiletsNotifier => _favoriteToiletsNotifier;

  static void toggleFavorite(Toilet toilet) {
    if (_favoriteToilets.contains(toilet)) {
      _favoriteToilets.remove(toilet);
    } else {
      _favoriteToilets.add(toilet);
    }
    _favoriteToiletsNotifier.value = _favoriteToilets;
  }

  static bool isFavorite(Toilet toilet) {
    return _favoriteToilets.contains(toilet);
  }
}

class ToiletInfo extends StatefulWidget {
  final Toilet toilet;

  const ToiletInfo({super.key, required this.toilet});

  @override
  State<ToiletInfo> createState() => _ToiletInfoState();
}

class _ToiletInfoState extends State<ToiletInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.67,
      child: Column(
        children: [
          Text(
            'Toilette sélectionnée : ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type : ${widget.toilet.type ?? "Non disponible"}',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Text(
                'Adresse : ${widget.toilet.adresse ?? "Non disponible"}',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Text(
                'Arrondissement : ${widget.toilet.arrondissement ?? "Non disponible"}',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              // ... autres champs
            ],
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () => _goToMap(context),
                    child: Text('Map'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: ValueListenableBuilder(
                    valueListenable: FavoriteService.favoriteToiletsNotifier,
                    builder: (context, _, child) {
                      bool isFavorite = FavoriteService.isFavorite(widget.toilet);
                      return ElevatedButton(
                        onPressed: () => FavoriteService.toggleFavorite(widget.toilet),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                            SizedBox(width: 8),
                            Text(isFavorite ? 'Enlever Favoris' : 'Favoris'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _goToMap(BuildContext context) {
    String toiletAddress = widget.toilet.adresse ?? "Adresse non disponible";
    // Logique pour aller à la carte
  }
}
