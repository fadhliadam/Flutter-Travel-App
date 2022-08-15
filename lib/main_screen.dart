import 'dart:async';
import 'package:Travel/modal_bottom_kelas.dart';
import 'package:Travel/modal_bottom_penumpang.dart';
import 'package:Travel/daftar_tiket_screen.dart';
import 'kota.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:Travel/warna.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  String printKelas = "Ekonomi";
  String namaBandaraAsal = 'Jakarta';
  String kodeBandaraAsal = 'CGK';
  String namaBandaraTujuan = 'Denpasar';
  String kodeBandaraTujuan = 'DPS';
  String aturBerdasarkan = 'Harga';
  final controllerPerjalanan = GroupButtonController(selectedIndex: 0);
  final controllerFilter = GroupButtonController(selectedIndex: 0);
  var berangkat = DateTime.now();
  DateTimeRange selectedRangeDate = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(hours: 24 * 3)),
  );
  var pulangPergi = false;
  final now = DateTime.now();
  var penumpang = [1, 0, 0];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: biru,
            ),
            child: child ?? const Text(""),
          );
        },
        initialDate: berangkat,
        firstDate: DateTime.now(),
        lastDate: DateTime(now.year + 1, now.month, now.day));
    if (picked != null && picked != berangkat) {
      setState(() {
        berangkat = picked;
        selectedRangeDate = DateTimeRange(
          start: berangkat,
          end: berangkat.add(const Duration(hours: 24 * 2)),
        );
      });
    }
  }

  Future<void> _selectRangeDate(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: biru,
            ),
            child: child ?? const Text(""),
          );
        },
        initialDateRange: selectedRangeDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(now.year + 1, now.month, now.day));
    if (picked != null && picked != selectedRangeDate) {
      setState(() {
        selectedRangeDate = picked;
        berangkat = selectedRangeDate.start;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: biru,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),
              SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Column(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.fly,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Travel',
                                  style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GroupButton(
                                controller: controllerPerjalanan,
                                isRadio: true,
                                onSelected: (value, index, isSelected) {
                                  setState(() {
                                    value == "Sekali Jalan"
                                        ? pulangPergi = false
                                        : pulangPergi = true;
                                  });
                                },
                                buttons: const ["Sekali Jalan", "Pulang-Pergi"],
                                options: GroupButtonOptions(
                                  unselectedTextStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  selectedTextStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                  unselectedColor: biru,
                                  selectedColor: Colors.white,
                                  selectedBorderColor: Colors.transparent,
                                  unselectedBorderColor: Colors.grey[300],
                                  unselectedShadow: <BoxShadow>[
                                    const BoxShadow(color: Colors.transparent)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  offset: const Offset(0, 6))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Kota Asal',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    OutlinedButton(
                                      onPressed: () async {
                                        final dataAsal = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Kota()));
                                        setState(() {
                                          namaBandaraAsal = dataAsal[0];
                                          kodeBandaraAsal = dataAsal[1];
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.flight_takeoff,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '$namaBandaraAsal ($kodeBandaraAsal)',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Kota Tujuan',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    OutlinedButton(
                                      onPressed: () async {
                                        final dataTujuan = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Kota()));
                                        setState(() {
                                          namaBandaraTujuan = dataTujuan[0];
                                          kodeBandaraTujuan = dataTujuan[1];
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.flight_land,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '$namaBandaraTujuan ($kodeBandaraTujuan)',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Tanggal Berangkat',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        pulangPergi != true
                                            ? _selectDate(context)
                                            : _selectRangeDate(context);
                                      },
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.date_range,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "${berangkat.day}/${berangkat.month}/${berangkat.year}"
                                                .split(' ')[0],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: pulangPergi,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'Tanggal Pulang',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          _selectRangeDate(context);
                                        },
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.date_range_outlined,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              "${selectedRangeDate.end.day}/${selectedRangeDate.end.month}/${selectedRangeDate.end.year}"
                                                  .split(' ')[0],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Penumpang',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    OutlinedButton(
                                      onPressed: () async {
                                        final dataPenumpang =
                                            await showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (context) {
                                                  return SingleChildScrollView(
                                                      child:
                                                          ModalBottomPenumpang(
                                                              setPenumpang:
                                                                  penumpang));
                                                });
                                        setState(() {
                                          penumpang = dataPenumpang;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.person_outline,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${penumpang[0]} Dewasa',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Visibility(
                                              visible: penumpang[1] != 0,
                                              child: Text(
                                                ', ${penumpang[1]} Anak',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              )),
                                          Visibility(
                                              visible: penumpang[2] != 0,
                                              child: Text(
                                                ', ${penumpang[2]} Bayi',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Kelas',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    OutlinedButton(
                                      onPressed: () async {
                                        final dataKelas =
                                            await showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return SingleChildScrollView(
                                                      child: ModalBottomKelas(
                                                          setTextKelas:
                                                              printKelas));
                                                });
                                        setState(() {
                                          printKelas = dataKelas;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.airline_seat_recline_extra,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            printKelas,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Atur Berdasarkan',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    GroupButton(
                                      controller: controllerFilter,
                                      isRadio: true,
                                      onSelected: (value, index, isSelected) =>
                                          aturBerdasarkan = value.toString(),
                                      buttons: const [
                                        "Harga",
                                        "Pelayanan",
                                        "Estimasi"
                                      ],
                                      options: GroupButtonOptions(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        selectedBorderColor: Colors.transparent,
                                        selectedColor: biru,
                                        unselectedBorderColor: Colors.grey[300],
                                        unselectedShadow: <BoxShadow>[
                                          const BoxShadow(
                                              color: Colors.transparent)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(500, 40),
                                  shadowColor: Colors.transparent,
                                  primary: biru,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: kodeBandaraAsal != kodeBandaraTujuan
                                    ? () {
                                        pulangPergi == false
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => DaftarTiketScreen(
                                                        namaBandaraAsal:
                                                            namaBandaraAsal,
                                                        kodeBandaraAsal:
                                                            kodeBandaraAsal,
                                                        namaBandaraTujuan:
                                                            namaBandaraTujuan,
                                                        kodeBandaraTujuan:
                                                            kodeBandaraTujuan,
                                                        tanggalBerangkat:
                                                            berangkat.day,
                                                        bulanBerangkat:
                                                            berangkat.month,
                                                        tahunBerangkat:
                                                            berangkat.year,
                                                        penumpang: penumpang,
                                                        kelas: printKelas,
                                                        aturBerdasarkan:
                                                            aturBerdasarkan,
                                                        pulangPergi: false)))
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => DaftarTiketScreen(
                                                        namaBandaraAsal:
                                                            namaBandaraAsal,
                                                        kodeBandaraAsal:
                                                            kodeBandaraAsal,
                                                        namaBandaraTujuan:
                                                            namaBandaraTujuan,
                                                        kodeBandaraTujuan:
                                                            kodeBandaraTujuan,
                                                        tanggalBerangkat:
                                                            berangkat.day,
                                                        bulanBerangkat:
                                                            berangkat.month,
                                                        tahunBerangkat:
                                                            berangkat.year,
                                                        penumpang: penumpang,
                                                        kelas: printKelas,
                                                        tanggalPulang:
                                                            selectedRangeDate
                                                                .end.day,
                                                        bulanPulang: selectedRangeDate
                                                            .end.month,
                                                        tahunPulang:
                                                            selectedRangeDate.end.year,
                                                        aturBerdasarkan: aturBerdasarkan,
                                                        pulangPergi: true)));
                                      }
                                    : null,
                                child: const Text(
                                  'Cari Tiket',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          );
        }));
  }
}
