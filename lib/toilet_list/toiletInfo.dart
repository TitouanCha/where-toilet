import 'package:flutter/material.dart';
import 'package:where_toilet/toilet_list/toilet.dart';

class ToiletInfo extends StatelessWidget {
  final Toilet toilet;

  const ToiletInfo({super.key, required this.toilet});

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
                'Type : ${toilet.type ?? "Non disponible"}',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Text(
                'Adresse : ${toilet.adresse ?? "Non disponible"}',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Text(
                'Arrondissement : ${toilet.arrondissement ?? "Non disponible"}',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Text(
                'Horaire : ${toilet.horaire ?? "24/24"}',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Text(
                'Accès PMR : ${toilet.accesPmr ?? "Non disponible"}',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              if (toilet.relaisBebe != null)
                Text(
                  'Relais bébé : ${toilet.relaisBebe}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.start,
                ),
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
                  child: ElevatedButton(
                    onPressed: () => (),
                    child: Text('Favoris'),
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
    String toiletAddress = toilet.adresse ?? "Adresse non disponible";
  }
}
