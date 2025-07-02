import 'package:flutter/material.dart';
import 'package:tekrar_calismasi/models/ogrenci.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasarimTekrar(),
    );
  }
}

class TasarimTekrar extends StatefulWidget {
  const TasarimTekrar({super.key});

  @override
  State<TasarimTekrar> createState() =>
      _TasarimTekrarState();
}

class _TasarimTekrarState
    extends State<TasarimTekrar> {
  List<Ogrenci> tumOgrenciler = List.generate(
    5000,
    (index) => Ogrenci(
      id: index + 1,
      isim: "Öğrenci adı: ${index + 1}",
      soyisim: "Soyisim: ${index + 1}",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasarım Tekrar"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            Ogrenci ogr = tumOgrenciler[index];
            return veriAlanSabitEleman(ogr);
          },
          separatorBuilder: (context, index) {
            return (index + 1) % 4 == 0
                ? Divider(
                    color: Colors.green,
                    thickness: 3,
                  )
                : Container();
          },
          itemCount: tumOgrenciler.length,
        ),
      ),
    );
  }

  SizedBox veriAlanSabitEleman(Ogrenci ogr) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.limeAccent,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    child: Text(
                      ogr.id.toString(),
                    ),
                  ),
                  title: Text(ogr.isim),
                  subtitle: Text(ogr.soyisim),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
