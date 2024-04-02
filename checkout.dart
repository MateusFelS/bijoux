import 'dart:convert';
import 'package:anotacoes/bijoutery.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'checkout_sucefull.dart';

class Checkout extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController cepController = TextEditingController();

  final List<String> itemNames;
  final List<int> itemQuantities;
  final double totalPrice;
  final List<double> itemPrices;

  Checkout({
    required this.itemNames,
    required this.itemQuantities,
    required this.totalPrice,
    required this.itemPrices,
  });

  Future<void> initiatePayment(BuildContext context) async {
    if (nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        cityController.text.isEmpty ||
        cepController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Campos Vazios"),
            content: Text("Por favor, preencha todos os campos."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }
    await Firebase.initializeApp();

    await FirebaseFirestore.instance.collection('dados_entrega').add({
      'name': nameController.text,
      'address': addressController.text,
      'city': cityController.text,
      'cep': cepController.text,
      'totalPrice': totalPrice,
      'itemNames': itemNames,
      'itemQuantities': itemQuantities,
      'itemPrices': itemPrices,
    });

    final accessToken =
        'APP_USR-6312049864203581-032820-500f4c6349ed0e4089b7e3349b807753-1082234735';
    final preferencia = {
      "items": itemNames.asMap().entries.map((entry) {
        int index = entry.key;
        String name = entry.value;
        return {
          "title": name,
          "quantity": itemQuantities[index],
          "currency_id": "BRL",
          "unit_price": itemPrices[index],
        };
      }).toList(),
      "payment_methods": {
        "excluded_payment_types": [
          {"id": "ticket"},
          {"id": "atm"}
        ],
        "excluded_payment_methods": [
          {"id": "visa"}
        ],
        "default_payment_method_id": "pix"
      }
    };
    try {
      final response = await http.post(
        Uri.parse('https://api.mercadopago.com/checkout/preferences'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: json.encode(preferencia),
      );
      final data = json.decode(response.body);
      final initPoint = data['init_point'];

      _launchURL(initPoint);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckoutSucefull(),
        ),
      );
    } catch (error) {
      print('Erro de rede: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Detalhes de entrega:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Rua e número'),
              ),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'Cidade'),
              ),
              TextFormField(
                controller: cepController,
                decoration: InputDecoration(labelText: 'CEP'),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Itens do Pedido:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: itemNames.length,
                      itemBuilder: (context, index) {
                        final itemName = itemNames[index];
                        final itemQuantity = itemQuantities[index];
                        final itemTotal = itemQuantity * itemPrices[index];

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(itemName),
                              Text('x$itemQuantity'),
                              Text('\$${itemTotal.toStringAsFixed(2)}',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        initiatePayment(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Color.fromARGB(255, 246, 233, 112),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Finalizar Pedido',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }
}
