import 'package:flutter/material.dart';
import 'form_page.dart'; // Import file form_page.dart

class DetailUndanganPage extends StatelessWidget {
  final Map<String, String> undangan;

  DetailUndanganPage({required this.undangan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Undangan'),
        backgroundColor: Color(0xFFE1BEE7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                undangan['image']!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                undangan['category']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9575CD),
                ),
              ),
              SizedBox(height: 8),
              Text(
                undangan['name']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9575CD), // Warna latar belakang
                  foregroundColor: Colors.white, // Warna teks
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormPage(undangan: undangan),
                    ),
                  );
                },
                child: Text('Pilih Undangan Ini'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
