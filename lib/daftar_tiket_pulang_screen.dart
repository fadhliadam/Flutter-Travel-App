import 'package:Travel/separator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'list_tiket.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class DaftarTiketPulangScreen extends StatelessWidget {
  final namaBandaraAsal, kodeBandaraAsal, namaBandaraTujuan, kodeBandaraTujuan;
  final tanggalBerangkat, bulanBerangkat, tahunBerangkat, kelas;
  final tanggalPulang, bulanPulang, tahunPulang, hargaBerangkat, namaMaskapai;
  final jamBerangkat, jamSampai;
  final List<int> penumpang;
  final formatter = NumberFormat.simpleCurrency(
    locale: "id",
    decimalDigits: 0,
  );
  final List namaBulan = [
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
  DaftarTiketPulangScreen(
      {Key? key,
      required this.namaBandaraAsal,
      required this.kodeBandaraAsal,
      required this.namaBandaraTujuan,
      required this.kodeBandaraTujuan,
      required this.tanggalBerangkat,
      required this.bulanBerangkat,
      required this.tahunBerangkat,
      required this.penumpang,
      required this.kelas,
      required this.tanggalPulang,
      required this.bulanPulang,
      required this.tahunPulang,
      required this.namaMaskapai,
      required this.jamBerangkat,
      required this.jamSampai,
      required this.hargaBerangkat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
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
                      Text('$kodeBandaraTujuan  '),
                      const FaIcon(
                        FontAwesomeIcons.plane,
                        color: Colors.black,
                        size: 18,
                      ),
                      Text('  $kodeBandaraAsal')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$tanggalPulang ${namaBulan[bulanPulang]} ',
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                ),
                child: Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: FaIcon(FontAwesomeIcons.arrowRightToCity)),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('$kodeBandaraAsal - $kodeBandaraTujuan | ',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 12)),
                              Text('$namaMaskapai',
                                  style: const TextStyle(fontSize: 12))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      '$tanggalBerangkat ${namaBulan[bulanBerangkat]} $tahunBerangkat | ',
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 12)),
                                  Text('$jamBerangkat - $jamSampai',
                                      style: const TextStyle(fontSize: 12))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(formatter.format(hargaBerangkat),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  Text('/orang',
                                      style: TextStyle(
                                          color: Colors.grey[700], fontSize: 9))
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final ListTiket tiket = tiketPenerbanganList[index];
                  final formatter = NumberFormat.simpleCurrency(
                    locale: "id",
                    decimalDigits: 0,
                  );
                  final harga = formatter.format(tiket.harga);
                  return GestureDetector(
                    onTap: () {
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
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        height: 135,
                        width: 300,
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(tiket.imageAsset,
                                              scale: 4.5),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
            ),
          ],
        ),
      ),
    );
  }
}
