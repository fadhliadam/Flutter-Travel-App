import 'package:flutter/material.dart';
import 'list_kota.dart';

class Kota extends StatefulWidget {
  const Kota({Key? key}) : super(key: key);
  @override
  State<Kota> createState() => _Kota();
}

class _Kota extends State<Kota> {
  List cariKota = [];

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = kotaBandaraList;
    } else {
      results = kotaBandaraList
          .where((city) => city.namaKota
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      cariKota = results;
    });
  }

  @override
  void initState() {
    cariKota = kotaBandaraList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pilih Kota',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    child: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.grey[700],
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Cari Kota Atau Bandara',
                      ),
                      onChanged: (value) => _runFilter(value),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Text('Kota atau Bandara Populer',
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                )),
            Expanded(
              child: cariKota.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        final ListKota bandara = cariKota[index];
                        return ListTile(
                          title: Text(
                              '${bandara.namaKota}, ${bandara.namaNegara}'),
                          subtitle: Text(
                              '${bandara.kodeBandara} - ${bandara.namaBandara}'),
                          onTap: () {
                            List<String> getKota = [
                              bandara.namaKota,
                              bandara.kodeBandara
                            ];
                            Navigator.pop(context, getKota);
                          },
                        );
                      },
                      itemCount: cariKota.length,
                      shrinkWrap: true,
                    )
                  : Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          const Text(
                            'Pencarian Tidak Ditemukan',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Image.asset(
                            'images/not_found.png',
                            scale: 3,
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
