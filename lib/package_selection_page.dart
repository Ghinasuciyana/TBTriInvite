import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'checkout_page.dart';

class PackageSelectionPage extends StatefulWidget {
  @override
  _PackageSelectionPageState createState() => _PackageSelectionPageState();
}

class _PackageSelectionPageState extends State<PackageSelectionPage> {
  String? selectedPackage;
  double? selectedPackagePrice;
  String? packageDescription;

  Future<void> _saveSelectedPackage() async {
    if (selectedPackage == null ||
        selectedPackagePrice == null ||
        packageDescription == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('Please select a package before continuing.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final url = 'http://10.0.2.2/triinvite/save_package_selection.php';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'selectedPackage': selectedPackage,
          'selectedPackagePrice': selectedPackagePrice,
          'packageDescription': packageDescription,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseData = json.decode(response.body);
      if (responseData['status'] == 'success') {
        print('Selected Package: $selectedPackage');
        print('Selected Package Price: $selectedPackagePrice');
        print('Package Description: $packageDescription');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutPage(
              selectedPackage: selectedPackage!,
              packagePrice: selectedPackagePrice!,
              packageDescription: packageDescription!,
            ),
          ),
        ).then((_) {
          // Clear selected package data after successful save
          setState(() {
            selectedPackage = null;
            selectedPackagePrice = null;
            packageDescription = null;
          });
        });
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error'),
            content: Text(responseData['message']),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Exception caught: $e');
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('An unexpected error occurred. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _onSelectPackage(
      String packageName, double packagePrice, String packageDetails) {
    setState(() {
      selectedPackage = packageName;
      selectedPackagePrice = packagePrice;
      packageDescription = packageDetails;
      print('Selected Package updated: $selectedPackage');
      print('Selected Package Price updated: $selectedPackagePrice');
      print('Package Description updated: $packageDescription');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Paket'),
        backgroundColor: Color(0xFFE1BEE7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Pilih paket yang kamu mau',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  PackageCard(
                    packageName: 'Paket 1',
                    packageDetails: 'Standar: Rp.70.000/masa aktif 7 hari',
                    isSelected: selectedPackage == 'Paket 1',
                    onSelect: () {
                      _onSelectPackage('Paket 1', 70000,
                          'Standar: Rp.70.000/masa aktif 7 hari');
                    },
                  ),
                  SizedBox(height: 16),
                  PackageCard(
                    packageName: 'Paket 2',
                    packageDetails: 'Medium: Rp.110.000/masa aktif 14 hari',
                    isSelected: selectedPackage == 'Paket 2',
                    onSelect: () {
                      _onSelectPackage('Paket 2', 110000,
                          'Medium: Rp.110.000/masa aktif 14 hari');
                    },
                  ),
                  SizedBox(height: 16),
                  PackageCard(
                    packageName: 'Paket 3',
                    packageDetails: 'VIP: Rp.200.000/masa aktif 30 hari',
                    isSelected: selectedPackage == 'Paket 3',
                    onSelect: () {
                      _onSelectPackage('Paket 3', 200000,
                          'VIP: Rp.200.000/masa aktif 30 hari');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedPackage != null ? Color(0xFF9575CD) : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed:
                    selectedPackage != null ? _saveSelectedPackage : null,
                child: Text('Lanjut'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String packageName;
  final String packageDetails;
  final bool isSelected;
  final VoidCallback onSelect;

  PackageCard({
    required this.packageName,
    required this.packageDetails,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? Color(0xFF9575CD) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    packageName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Color(0xFF9575CD) : Colors.black,
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: Color(0xFF9575CD),
                    ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                packageDetails,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
