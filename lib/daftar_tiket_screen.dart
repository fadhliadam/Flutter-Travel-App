import 'package:Travel/daftar_tiket_pulang_screen.dart';
import 'package:Travel/data_penumpang_screen.dart';
import 'package:Travel/separator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'list_tiket.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class DaftarTiketScreen extends StatelessWidget {
  final namaBandaraAsal, kodeBandaraAsal, namaBandaraTujuan, kodeBandaraTujuan;
  final tanggalBerangkat,
      bulanBerangkat,
      tahunBerangkat,
      kelas,
      aturBerdasarkan;
  final tanggalPulang, bulanPulang, tahunPulang;
  final bool? pulangPergi;
  final List<int> penumpang;
  List namaBulan = [
    null,
    'Jan',
    'Feb',
    'Mar',
    'April',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des'
  ];
  DaftarTiketScreen({
    Key? key,
    required this.namaBandaraAsal,
    required this.kodeBandaraAsal,
    required this.namaBandaraTujuan,
    required this.kodeBandaraTujuan,
    required this.tanggalBerangkat,
    required this.bulanBerangkat,
    required this.tahunBerangkat,
    required this.penumpang,
    required this.kelas,
    required this.aturBerdasarkan,
    this.tanggalPulang,
    this.bulanPulang,
    this.tahunPulang,
    this.pulangPergi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('$kodeBandaraAsal  '),
                      const FaIcon(
                        FontAwesomeIcons.plane,
                        color: Colors.black,
                        size: 18,
                      ),
                      Text('  $kodeBandaraTujuan')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$tanggalBerangkat ${namaBulan[bulanBerangkat]} ',
                          style: const TextStyle(fontSize: 12)),
                      const Icon(Icons.circle, size: 4, color: Colors.black),
                      Text(' ${penumpang.sum} Orang',
                          style: const TextStyle(fontSize: 12)),
                      const Text(' '),
                      const Icon(Icons.circle, size: 4, color: Colors.black),
                      Text(' $kelas', style: const TextStyle(fontSize: 12))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        elevation: 1,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          switch (aturBerdasarkan) {
            case "Harga":
              tiketPenerbanganList.sort((a, b) => a.harga.compareTo(b.harga));
              break;
            case "Pelayanan":
              tiketPenerbanganList
                  .sort((b, a) => a.muatanBagasi.compareTo(b.muatanBagasi));
              break;
            case "Estimasi":
              tiketPenerbanganList.sort((a, b) =>
                  a.estimasiPenerbangan.compareTo(b.estimasiPenerbangan));
              break;
          }
          final ListTiket tiket = tiketPenerbanganList[index];
          final formatter = NumberFormat.simpleCurrency(
            locale: "id",
            decimalDigits: 0,
          );
          final harga = formatter.format(tiket.harga);
          return GestureDetector(
            onTap: () {
              pulangPergi == false
                  ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataPenumpangScreen(
                    namaBandaraAsal: namaBandaraAsal,
                    kodeBandaraAsal: kodeBandaraAsal,
                    logoMaskapai: tiket.imageAsset,
                    kodeBandaraTujuan: kodeBandaraTujuan,
                    kelas: kelas,
                    pulangPergi: false,
                    namaMaskapai: tiket.namaMaskapai,
                    kodeMaskapai: tiket.kodeMaskapai,
                    tahunBerangkat: tahunBerangkat,
                    bulanBerangkat: bulanBerangkat,
                    tanggalBerangkat: tanggalBerangkat,
                    jamBerangkat: tiket.jamBerangkat,
                    jamSampai: tiket.jamSampai,
                    namaBandaraTujuan: namaBandaraTujuan,
                    penumpang: penumpang,
                    hargaBerangkat: tiket.harga,
                    muatanBagasi: tiket.muatanBagasi,
                    estimasiPenerbangan: tiket.estimasiPenerbangan,
                  )
                )
              ) : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DaftarTiketPulangScreen(
                                namaBandaraAsal: namaBandaraAsal,
                                kodeBandaraAsal: kodeBandaraAsal,
                                namaBandaraTujuan: namaBandaraTujuan,
                                kodeBandaraTujuan: kodeBandaraTujuan,
                                tanggalBerangkat: tanggalBerangkat,
                                bulanBerangkat: bulanBerangkat,
                                tahunBerangkat: tahunBerangkat,
                                penumpang: penumpang,
                                kelas: kelas,
                                tanggalPulang: tanggalPulang,
                                bulanPulang: bulanPulang,
                                tahunPulang: tahunPulang,
                                namaMaskapai: tiket.namaMaskapai,
                                jamBerangkat: tiket.jamBerangkat,
                                jamSampai: tiket.jamSampai,
                                hargaBerangkat: tiket.harga,
                              )));
              print('${tiket.harga}');
            },
            child: Container(
              margin: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5))
                  ]),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                height: 135,
                width: 300,
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(tiket.imageAsset, scale: 4.5),
                                  Text(
                                    ' ${tiket.namaMaskapai}',
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    harga,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text('/orang')
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 14.0, left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                Text('${tiket.jamBerangkat}  ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const Icon(Icons.circle, size: 8),
                                const Flexible(
                                    child: Separator(dashWidth: 5.0)),
                                const Icon(Icons.circle, size: 8),
                                Text('   ${tiket.jamSampai}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(kodeBandaraAsal),
                                Text(tiket.kodeMaskapai,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(kodeBandaraTujuan)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Separator(color: Colors.grey, dashWidth: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.luggage,
                                  size: 20, color: Colors.grey[700]),
                              Text(
                                ' ${tiket.muatanBagasi}',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.clock,
                                  size: 16, color: Colors.grey[700]),
                              Text(
                                ' ${tiket.estimasiPenerbangan}',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: tiketPenerbanganList.length,
      ),
    );
  }
}
