import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:where_toilet/web_services/toilet.dart';
import 'package:where_toilet/web_services/toiletInfo.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool _loading = true;
  final List<Toilet> _products = [];
  Exception? _error;

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  void _getProducts() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://opendata.paris.fr/api/explore/v2.1/catalog/datasets',
      ),
    );

    try {
      final response = await dio.get('/sanisettesparis/records?limit=20');
      final products =
          (response.data['results'] as List)
              .map((json) => Toilet.fromJson(json))
              .toList();
      setState(() {
        _loading = false;
        _products.clear();
        _products.addAll(products);
      });
    } catch (error) {
      setState(() {
        _loading = false;
        _error = Exception();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        elevation: 4,
        centerTitle: true,
        title: Text(
          "Toilet list ",
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
    if (_loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text('Oups une erreur est survenue'));
    }

    if (_products.isEmpty) {
      return Center(child: Text('Aucune toilettes trouvé'));
    }

    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final toilet = _products[index];
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
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                        ),
                        backgroundColor: Colors.blue,
                        behavior: SnackBarBehavior.fixed,
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        duration: Duration(days: 1),
                        content: ToiletInfo(toilet: _products[index]),
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
  }
}
