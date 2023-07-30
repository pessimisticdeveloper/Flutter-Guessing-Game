import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tahminoyunu/sonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tfTahmin = TextEditingController();
  var rasgeleSayi = 0;
  var kalanCan = 5;
  var yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rasgeleSayi = Random().nextInt(101); //0-100
    print("sayı: $rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Can : $kalanCan",
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),
            Text(
              "Tahmin:  $yonlendirme",
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  "Tahmin Et",
                ),
                onPressed: () {
                  setState(() {
                    kalanCan = kalanCan - 1;
                  });
                  var tahmin = int.parse(tfTahmin.text);
                  if (tahmin == rasgeleSayi) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(
                                  sonuc: true,
                                )));
                    return;
                  }
                  if (tahmin > rasgeleSayi) {
                    setState(() {
                      yonlendirme = "Azalt";
                    });
                  }
                  if (tahmin < rasgeleSayi) {
                    setState(() {
                      yonlendirme = "Arttır";
                    });
                  }
                  if (kalanCan == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(
                                  sonuc: false,
                                )));
                  }
                  tfTahmin.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
