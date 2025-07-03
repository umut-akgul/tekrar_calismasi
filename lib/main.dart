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

class _TasarimTekrarState extends State<TasarimTekrar> {
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
      backgroundColor: Colors.black54,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            title: Text("SliverAppBar"),
            backgroundColor: Colors.black,
            expandedHeight: 300,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Sliverappbar",
                style: TextStyle(color: Colors.white),
              ),
              background: Image.network(
                "https://cdnb.artstation.com/p/assets/images/images/036/276/145/large/anirban-sarkar-0008.jpg?1617206829",
              ),
            ),
          ),
          sliverlistDynamicOrnek(),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 30,
            ),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                sabitGridViewEleman(Colors.teal.shade400),
                sabitGridViewEleman(Colors.teal.shade500),
                sabitGridViewEleman(Colors.teal.shade500),
                sabitGridViewEleman(Colors.teal.shade400),
                sabitGridViewEleman(Colors.teal.shade400),
                sabitGridViewEleman(Colors.teal.shade500),
                sabitGridViewEleman(Colors.teal.shade500),
                sabitGridViewEleman(Colors.teal.shade400),
              ]),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  SliverPadding sliverlistDynamicOrnek() {
    return SliverPadding(
      padding: EdgeInsetsGeometry.all(10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 20,
          (context, index) {
            return dinamikGridElemani(index);
          },
        ),
      ),
    );
  }

  GridView gridviewDynamicExtentOrnek() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 8,
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 25,
            mainAxisSpacing: 20,
            maxCrossAxisExtent: 220,
          ),
      itemBuilder: (context, index) {
        return dinamikGridElemani(index);
      },
    );
  }

  GridView gridviewExtentOrnek() {
    return GridView.extent(
      maxCrossAxisExtent: 80,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: [
        sabitGridViewEleman(Colors.red),
        sabitGridViewEleman(Colors.green),
        sabitGridViewEleman(Colors.brown),
        sabitGridViewEleman(Colors.blue),
        sabitGridViewEleman(Colors.black),
        sabitGridViewEleman(Colors.grey),
        sabitGridViewEleman(Colors.purple),
      ],
    );
  }

  Padding seperatedListviewOrnek() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView.separated(
        itemBuilder: (context, index) {
          Ogrenci ogr = tumOgrenciler[index];
          return veriAlanSabitEleman(ogr);
        },
        separatorBuilder: (context, index) {
          return (index + 1) % 4 == 0
              ? Divider(color: Colors.green, thickness: 3)
              : Container();
        },
        itemCount: tumOgrenciler.length,
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    child: Text(ogr.id.toString()),
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

  Widget sabitGridViewEleman(Color bgColor) {
    return Container(
      height: 150,
      color: bgColor,
      child: Text("Deneme"),
    );
  }

  dinamikGridElemani(int index) {
    return Container(
      height: 100,
      color: Colors.teal[((((index + 1)) % 8) + 1) * 100],
      child: Text("Deneme"),
    );
  }
}
