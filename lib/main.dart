import 'package:flutter/material.dart';
import 'main_page.dart';
import 'login.dart';
import 'register.dart';
import 'dashboard.dart';
import 'customer_service_page.dart';
import 'riwayat_transaksi.dart';
import 'package_selection_page.dart';

void main() {
  runApp(TriInviteApp());
}

class TriInviteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TriInvite',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/main': (context) => MainPage(),
        '/dashboard': (context) => DashboardPage(),
        '/customer_service': (context) => CustomerServicePage(),
        '/riwayat_transaksi': (context) => TransactionHistoryPage(),
        '/package_selection': (context) => PackageSelectionPage(),
      },
    );
  }
}
