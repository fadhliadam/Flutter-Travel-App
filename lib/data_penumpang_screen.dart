import 'package:flutter/material.dart';
import 'package:Travel/separator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DataPenumpangScreen extends StatefulWidget{
  final namaBandaraAsal, kodeBandaraAsal, namaBandaraTujuan, kodeBandaraTujuan;
  final tanggalBerangkat, bulanBerangkat, tahunBerangkat, kelas, estimasiPenerbangan;
  final hargaBerangkat, namaMaskapai, kodeMaskapai, logoMaskapai, muatanBagasi;
  final jamBerangkat, jamSampai, tanggalPulang, bulanPulang, tahunPulang;
  final bool? pulangPergi;
  final List<int> penumpang;
  const DataPenumpangScreen(
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
        this.tanggalPulang,
        this.bulanPulang,
        this.tahunPulang,
        required this.namaMaskapai,
        required this.kodeMaskapai,
        required this.logoMaskapai,
        required this.muatanBagasi,
        required this.jamBerangkat,
        required this.jamSampai,
        required this.estimasiPenerbangan,
        required this.hargaBerangkat,
        required this.pulangPergi,
      })
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _DataPenumpangScreen();
}

class _DataPenumpangScreen extends State<DataPenumpangScreen>{
  List namaBulan = [
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
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(
      locale: "id",
      decimalDigits: 0,
    );
    final hargaToRupiah = formatter.format(widget.hargaBerangkat);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Isi Data Penumpang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          Container(
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
                                Image.asset(widget.logoMaskapai, scale: 4.5),
                                Text(
                                  widget.namaMaskapai,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  hargaToRupiah,
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
                              Text(widget.jamBerangkat,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.circle, size: 8),
                              ),
                              const Flexible(
                                  child: Separator(dashWidth: 5.0)),
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.circle, size: 8),
                              ),
                              Text(widget.jamSampai,
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
                              Text(widget.kodeBandaraAsal),
                              Text(widget.kodeMaskapai,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(widget.kodeBandaraTujuan)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Separator(color: Colors.grey, dashWidth: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.tanggalBerangkat} ${namaBulan[widget.bulanBerangkat]} ${widget.tahunBerangkat}',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.kelas,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock,
                                size: 16, color: Colors.grey[700]),
                            Text(
                              widget.estimasiPenerbangan,
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: const Text(
                        'Data Penumpang',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 26,
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.man, size: 28, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Penumpang 1 - Dewasa',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}