class ListTiket {
  String namaMaskapai = '';
  String kodeMaskapai = '';
  int harga = 0;
  String jamBerangkat = '';
  String jamSampai = '';
  String muatanBagasi = '';
  String estimasiPenerbangan = '';
  String imageAsset = '';

  ListTiket(
      {required this.imageAsset,
      required this.namaMaskapai,
      required this.kodeMaskapai,
      required this.harga,
      required this.jamBerangkat,
      required this.jamSampai,
      required this.muatanBagasi,
      required this.estimasiPenerbangan});
}

var tiketPenerbanganList = [
  ListTiket(
      imageAsset: 'images/lion.png',
      namaMaskapai: 'Lion Air',
      kodeMaskapai: 'JT-34',
      harga: 888100,
      jamBerangkat: '06:00',
      jamSampai: '08:50',
      muatanBagasi: '10Kg',
      estimasiPenerbangan: '1j 50m'),
  ListTiket(
      imageAsset: 'images/sriwijaya.png',
      namaMaskapai: 'Sriwijaya Air',
      kodeMaskapai: 'SJ-21',
      harga: 992300,
      jamBerangkat: '20:30',
      jamSampai: '21:20',
      muatanBagasi: '20Kg',
      estimasiPenerbangan: '1j 50m'),
  ListTiket(
      imageAsset: 'images/sriwijaya.png',
      namaMaskapai: 'Sriwijaya Air',
      kodeMaskapai: 'SJ-172',
      harga: 1077030,
      jamBerangkat: '05:00',
      jamSampai: '07:55',
      muatanBagasi: '20Kg',
      estimasiPenerbangan: '1j 55m'),
  ListTiket(
      imageAsset: 'images/lion.png',
      namaMaskapai: 'Lion Air',
      kodeMaskapai: 'JT-30',
      harga: 1157900,
      jamBerangkat: '10:00',
      jamSampai: '12:50',
      muatanBagasi: '20Kg',
      estimasiPenerbangan: '1j 50m'),
  ListTiket(
      imageAsset: 'images/batik.png',
      namaMaskapai: 'Batik Air',
      kodeMaskapai: 'ID-32',
      harga: 1203400,
      jamBerangkat: '10:00',
      jamSampai: '12:50',
      muatanBagasi: '20Kg',
      estimasiPenerbangan: '1j 50m'),
  ListTiket(
      imageAsset: 'images/lion.png',
      namaMaskapai: 'Lion Air',
      kodeMaskapai: 'JT-48',
      harga: 1208100,
      jamBerangkat: '19:00',
      jamSampai: '20:50',
      muatanBagasi: '20Kg',
      estimasiPenerbangan: '1j 50m'),
  ListTiket(
      imageAsset: 'images/nam.png',
      namaMaskapai: 'NAM Air',
      kodeMaskapai: 'IN-280',
      harga: 1479960,
      jamBerangkat: '06:00',
      jamSampai: '07:30',
      muatanBagasi: '20Kg',
      estimasiPenerbangan: '1j 30m'),
];
