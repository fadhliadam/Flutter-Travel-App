import 'package:flutter/material.dart';

class ModalBottomKelas extends StatelessWidget {
  final setTextKelas;
  ModalBottomKelas({Key? key, required this.setTextKelas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String printKelas = setTextKelas;
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(padding: EdgeInsets.only(right: 40.0)),
              const Text('Pilih Kelas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: IconButton(
                  icon: const Icon(Icons.close, size: 26),
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: printKelas == "Ekonomi"
              ? const Text("Ekonomi",
                  style: TextStyle(fontWeight: FontWeight.bold))
              : const Text("Ekonomi"),
          subtitle: const Text("Deskripsi Kelas"),
          selected: printKelas == "Ekonomi" ? true : false,
          selectedTileColor: Colors.blue[50],
          selectedColor: Colors.black,
          trailing: Visibility(
            visible: printKelas == "Ekonomi",
            child: const Icon(
              Icons.check_circle,
              color: Color(0xFF044EE3),
            ),
          ),
          onTap: () {
            printKelas = "Ekonomi";
            Navigator.pop(context, printKelas);
          },
        ),
        ListTile(
          title: printKelas == "Bisnis"
              ? const Text("Bisnis",
                  style: TextStyle(fontWeight: FontWeight.bold))
              : const Text("Bisnis"),
          subtitle: const Text("Deskripsi Kelas"),
          selected: printKelas == "Bisnis" ? true : false,
          selectedTileColor: Colors.blue[50],
          selectedColor: Colors.black,
          trailing: Visibility(
            visible: printKelas == "Bisnis",
            child: Icon(
              Icons.check_circle,
              color: Colors.blue[500],
            ),
          ),
          onTap: () {
            printKelas = "Bisnis";
            Navigator.pop(context, printKelas);
          },
        ),
        ListTile(
          title: printKelas == "First Class"
              ? const Text("First Class",
                  style: TextStyle(fontWeight: FontWeight.bold))
              : const Text("First Class"),
          subtitle: const Text("Deskripsi Kelas"),
          selected: printKelas == "First Class" ? true : false,
          selectedTileColor: Colors.blue[50],
          selectedColor: Colors.black,
          trailing: printKelas == "First Class"
              ? Icon(
                  Icons.check_circle,
                  color: Colors.blue[500],
                )
              : null,
          onTap: () {
            printKelas = "First Class";
            Navigator.pop(context, printKelas);
          },
        ),
      ],
    );
  }
}
