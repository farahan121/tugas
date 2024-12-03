import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Hitung Umur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Fungsi(),
    );
  }
}

class Fungsi extends StatefulWidget {

  const Fungsi({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<Fungsi> {
  TextEditingController dateController = TextEditingController();
  String umur = '';

  // Fungsi untuk menghitung umur
  void _hitungUmur() {
    if (dateController.text.isEmpty) return;

    try {
      DateTime today = DateTime.now();
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      DateTime birthDate = dateFormat.parse(dateController.text);

      int years = today.year - birthDate.year;
      int months = today.month - birthDate.month;
      int days = today.day - birthDate.day;

      if (days < 0) {
        months--;
        days += DateTime(today.year, today.month, 0).day;
      }

      if (months < 0) {
        years--;
        months += 12;
      }

      setState(() {
        umur = '$years tahun, $months bulan, $days hari';
      });
    } catch (e) {
      setState(() {
        umur = 'Format tanggal tidak valid.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Hitung Umur'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Masukkan Tanggal Lahir (yyyy-mm-dd)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hitungUmur,
              child: Text('Hitung Umur'),
            ),
            SizedBox(height: 20),
            Text(
              umur,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}