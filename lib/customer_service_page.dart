import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard.dart';

class CustomerServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Service'),
        backgroundColor: Color(0xFFE1BEE7),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          // Tambahkan SingleChildScrollView di sini
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 16),
                Text(
                  'Hubungi Kami',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Untuk pertanyaan lebih lanjut, silahkan hubungi kami melalui salah satu saluran berikut:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF666666),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                _buildContactBox(
                  icon: FontAwesomeIcons.whatsapp,
                  title: 'WhatsApp',
                  content: '+62 1234 5678 910',
                ),
                SizedBox(height: 16),
                _buildContactBox(
                  icon: Icons.email,
                  title: 'Email',
                  content: 'TriInvite@gmail.com',
                ),
                SizedBox(height: 16),
                _buildContactBox(
                  icon: Icons.access_time,
                  title: 'Waktu Pelayanan',
                  content: 'Setiap Hari\n08.00 - 22.00',
                ),
                SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.whatsapp,
                        color: Color(0xFF25D366)),
                    title: Text('Chat via WhatsApp'),
                    onTap: () {
                      // Aksi untuk membuka WhatsApp
                    },
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue),
                    title: Text('Hubungi Kami'),
                    onTap: () {
                      // Aksi untuk memulai panggilan telepon
                    },
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.red),
                    title: Text('Email Kami'),
                    onTap: () {
                      // Aksi untuk mengirim email
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF9575CD)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, color: Color(0xFF9575CD)),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent, color: Color(0xFF9575CD)),
            label: 'CS',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          } else if (index == 1) {
            Navigator.pushNamed(context, '/dashboard');
          }
        },
      ),
    );
  }

  Widget _buildContactBox(
      {required IconData icon,
      required String title,
      required String content}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, size: 40, color: Color(0xFF333333)),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
