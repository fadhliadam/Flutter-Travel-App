import 'package:flutter/material.dart';
import 'package:Travel/warna.dart';

class ModalBottomPenumpang extends StatefulWidget {
  final setPenumpang;
  const ModalBottomPenumpang({Key? key, required this.setPenumpang})
      : super(key: key);
  @override
  State<ModalBottomPenumpang> createState() => _ModalBottomPenumpang();
}

class _ModalBottomPenumpang extends State<ModalBottomPenumpang> {
  final minDewasa = 1, minAnak = 0, minBayi = 0;
  final maxDewasa = 7, maxAnak = 6, maxBayi = 4;
  var decButtonkategoriUsia = {'Dewasa': false, 'Anak': false, 'Bayi': false};
  var incButtonkategoriUsia = {'Dewasa': false, 'Anak': false, 'Bayi': false};
  final TextEditingController _controllerDewasa = TextEditingController();
  final TextEditingController _controllerAnak = TextEditingController();
  final TextEditingController _controllerBayi = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerDewasa.text = widget.setPenumpang[0].toString();
    _controllerAnak.text = widget.setPenumpang[1].toString();
    _controllerBayi.text = widget.setPenumpang[2].toString();
    _controllerDewasa.addListener(() {
      final isDecButtonActive = _controllerDewasa.text == '1' ? true : false;
      final isIncButtonActive = _controllerDewasa.text == '7' ? true : false;
      setState(() {
        decButtonkategoriUsia['Dewasa'] = isDecButtonActive;
        incButtonkategoriUsia['Dewasa'] = isIncButtonActive;
      });
    });
    _controllerAnak.addListener(() {
      final isDecButtonActive = _controllerAnak.text == '0' ? true : false;
      final isIncButtonActive = _controllerAnak.text == '6' ? true : false;
      setState(() {
        decButtonkategoriUsia['Anak'] = isDecButtonActive;
        incButtonkategoriUsia['Anak'] = isIncButtonActive;
      });
    });
    _controllerBayi.addListener(() {
      final isDecButtonActive = _controllerBayi.text == '0' ? true : false;
      final isIncButtonActive = _controllerBayi.text == '4' ? true : false;
      setState(() {
        decButtonkategoriUsia['Bayi'] = isDecButtonActive;
        incButtonkategoriUsia['Bayi'] = isIncButtonActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(padding: EdgeInsets.only(right: 40.0)),
              const Text('Jumlah Penumpang',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: IconButton(
                  icon: const Icon(Icons.close, size: 24),
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        Card(
          child: ListTile(
            title: Row(
              children: const [
                Text('Dewasa ', style: TextStyle(fontSize: 14)),
                Text('(Usia > 12 tahun)',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            trailing: SizedBox(
              width: 100.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: decButtonkategoriUsia['Dewasa'] == false
                          ? () {
                              int currentValue =
                                  int.parse(_controllerDewasa.text);
                              setState(() {
                                currentValue > minDewasa
                                    ? currentValue--
                                    : currentValue;
                                _controllerDewasa.text =
                                    (currentValue).toString();
                              });
                            }
                          : null,
                      child: Text('—',
                          style: TextStyle(fontSize: 20, color: biru)),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _controllerDewasa,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: incButtonkategoriUsia['Dewasa'] == false
                          ? () {
                              int currentValue =
                                  int.parse(_controllerDewasa.text);
                              setState(() {
                                currentValue < maxDewasa
                                    ? currentValue++
                                    : currentValue;
                                _controllerDewasa.text =
                                    (currentValue).toString();
                              });
                            }
                          : null,
                      child: Text('+',
                          style: TextStyle(fontSize: 20, color: biru)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Row(
              children: const [
                Text('Anak ', style: TextStyle(fontSize: 14)),
                Text('(Usia 2-11 tahun)',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            trailing: SizedBox(
              width: 100.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: decButtonkategoriUsia['Anak'] == false
                          ? () {
                              int currentValue =
                                  int.parse(_controllerAnak.text);
                              setState(() {
                                currentValue > minAnak
                                    ? currentValue--
                                    : currentValue;
                                _controllerAnak.text =
                                    (currentValue).toString();
                              });
                            }
                          : null,
                      child: Text('—',
                          style: TextStyle(fontSize: 20, color: biru)),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _controllerAnak,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: incButtonkategoriUsia['Anak'] == false
                          ? () {
                              int currentValue =
                                  int.parse(_controllerAnak.text);
                              setState(() {
                                currentValue < maxAnak
                                    ? currentValue++
                                    : currentValue;
                                _controllerAnak.text =
                                    (currentValue).toString();
                              });
                            }
                          : null,
                      child: Text('+',
                          style: TextStyle(fontSize: 20, color: biru)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Row(
              children: const [
                Text('Bayi ', style: TextStyle(fontSize: 14)),
                Text('(Usia < 2 tahun)',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            trailing: SizedBox(
              width: 100.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: decButtonkategoriUsia['Bayi'] == false
                          ? () {
                              int currentValue =
                                  int.parse(_controllerBayi.text);
                              setState(() {
                                currentValue > minBayi
                                    ? currentValue--
                                    : currentValue;
                                _controllerBayi.text =
                                    (currentValue).toString();
                              });
                            }
                          : null,
                      child: Text('—',
                          style: TextStyle(fontSize: 20, color: biru)),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _controllerBayi,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: incButtonkategoriUsia['Bayi'] == false
                          ? () {
                              int currentValue =
                                  int.parse(_controllerBayi.text);
                              setState(() {
                                currentValue < maxBayi
                                    ? currentValue++
                                    : currentValue;
                                _controllerBayi.text =
                                    (currentValue).toString();
                              });
                            }
                          : null,
                      child: Text('+',
                          style: TextStyle(fontSize: 20, color: biru)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: biru,
              minimumSize: Size(height, 40),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              var penumpang = [
                int.parse(_controllerDewasa.text),
                int.parse(_controllerAnak.text),
                int.parse(_controllerBayi.text)
              ];
              Navigator.pop(context, penumpang);
            },
            child: const Text(
              'Konfirmasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controllerDewasa.dispose();
    _controllerAnak.dispose();
    _controllerBayi.dispose();
    super.dispose();
  }
}
