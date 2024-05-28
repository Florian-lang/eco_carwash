import 'package:eco_carwash/model/wash_station.dart';
import 'package:flutter/material.dart';

import '../service/price_service.dart';

class WashStationPricePage extends StatefulWidget {
  final WashStation washStation;

  const WashStationPricePage({Key? key, required this.washStation}) : super(key: key);

  @override
  _WashStationPricePage createState() => _WashStationPricePage();
}

class _WashStationPricePage extends State<WashStationPricePage> {
  final _formKey = GlobalKey<FormState>();
  final _priceController = TextEditingController();
  final _priceService = PriceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarif', style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.onPrimary)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Saisir le tarif de la station de lavage'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un tarif';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    _priceService.savePrice(_priceController.text, widget.washStation);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Tarif enregistré',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondary
                              )
                          ),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                        )
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Erreur lors de l\'enregistrement du tarif',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.onError
                              )
                          ),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        )
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.secondary),
              child: Text('Enregistrer', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            ),
          ],
        ),
      ),
    );
  }
}