import 'package:flutter/material.dart';
import 'package:tahminoyunu/tahminEkrani.dart';

class SonucEkrani extends StatefulWidget {
  bool sonuc;

  SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc
                ? SizedBox(
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.emoji_emotions,
                      size: 200,
                      color: Colors.green,
                    ),
                  )
                : SizedBox(
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.error_sharp,
                      size: 200,
                      color: Colors.green,
                    ),
                  ),
            Text(
              widget.sonuc ? "Kazandınız..." : "Kaybettiniz...",
              style: TextStyle(color: Colors.green, fontSize: 36),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  "Tekrar Oyna",
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
