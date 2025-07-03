import 'package:flutter/material.dart';
import 'package:where_toilet/toilet_list/toilet.dart';
import 'package:where_toilet/toilet_list/toiletInfo.dart';

class FavoriteToiletListScreen extends StatefulWidget {
  @override
  _FavoriteToiletListScreenState createState() =>
      _FavoriteToiletListScreenState();
}

class _FavoriteToiletListScreenState extends State<FavoriteToiletListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        elevation: 4,
        centerTitle: true,
        title: Text(
          "Toilettes favorites",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(Duration(seconds: 1)),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: FavoriteService.favoriteToilets.length,
          itemBuilder: (context, index) {
            final toilet = FavoriteService.favoriteToilets[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      toilet.type ?? 'Type inconnu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      toilet.adresse ?? "",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      toilet.horaire ?? "24/24",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            backgroundColor: Colors.blue,
                            behavior: SnackBarBehavior.fixed,
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            duration: Duration(days: 1),
                            content: ToiletInfo(toilet: toilet),
                          ),
                        );
                      },
                      child: Text('View more'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
