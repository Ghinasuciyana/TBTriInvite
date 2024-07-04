import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'riwayat_transaksi.dart';

class CheckoutPage extends StatefulWidget {
  final String selectedPackage;
  final double packagePrice;
  final String packageDescription;

  CheckoutPage({
    required this.selectedPackage,
    required this.packagePrice,
    required this.packageDescription,
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  String? paymentMethod;

  Future<void> _submitForm() async {
    final url =
        'http://10.0.2.2/triinvite/submit_checkout.php'; // Ganti dengan URL endpoint Anda

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'selectedPackage': widget.selectedPackage,
          'packagePrice': widget.packagePrice.toString(),
          'paymentMethod': paymentMethod!,
        },
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200 && responseData['status'] == 'success') {
        // Handle success
        print('Data successfully saved.');
        // Navigate to transaction history page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TransactionHistoryPage()),
        );
      } else {
        // Handle error
        print('Error saving data: ${responseData['message']}');
        _showErrorDialog('Error', 'Failed to save data. Please try again.');
      }
    } catch (e) {
      print('Exception caught: $e');
      _showErrorDialog(
          'Error', 'An unexpected error occurred. Please try again.');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Color(0xFFE1BEE7),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Package:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${widget.selectedPackage}\n${widget.packageDescription}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Payment Method:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: paymentMethod,
                items: [
                  DropdownMenuItem(
                    child: Text('Dana'),
                    value: 'Dana',
                  ),
                  DropdownMenuItem(
                    child: Text('OVO'),
                    value: 'OVO',
                  ),
                  DropdownMenuItem(
                    child: Text('Gopay'),
                    value: 'Gopay',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Choose payment method';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitForm();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Pay',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
