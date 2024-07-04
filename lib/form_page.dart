import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package_selection_page.dart';

void main() {
  runApp(MaterialApp(
    home: FormPage(undangan: {'category': 'Wedding'}),
  ));
}

class FormPage extends StatefulWidget {
  final Map<String, String> undangan;

  FormPage({required this.undangan});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Form fields variables
  String? namaMempelaiWanita;
  String? orangTuaWanita;
  String? anakKeWanita;
  String? namaMempelaiPria;
  String? orangTuaPria;
  String? anakKePria;
  DateTime? tanggalAkad;
  TimeOfDay? jamAkad;
  DateTime? tanggalResepsi;
  TimeOfDay? jamResepsi;
  String? namaDikhitan;
  String? namaOrangTua;
  DateTime? tanggalAcara;
  TimeOfDay? jamAcara;
  String? lokasiAcara;

  // Controllers for time inputs
  TextEditingController jamAkadController = TextEditingController();
  TextEditingController jamResepsiController = TextEditingController();
  TextEditingController jamAcaraController = TextEditingController();

  Future<void> _submitForm() async {
    final url = 'http://10.0.2.2/triinvite/save_from_data.php';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'category': widget.undangan['category']!,
          'namaMempelaiWanita': namaMempelaiWanita ?? '',
          'orangTuaWanita': orangTuaWanita ?? '',
          'anakKeWanita': anakKeWanita ?? '',
          'namaMempelaiPria': namaMempelaiPria ?? '',
          'orangTuaPria': orangTuaPria ?? '',
          'anakKePria': anakKePria ?? '',
          'tanggalAkad': tanggalAkad != null
              ? DateFormat('yyyy-MM-dd').format(tanggalAkad!)
              : '',
          'jamAkad': jamAkad != null ? _formatTimeOfDay(jamAkad!) : '',
          'tanggalResepsi': tanggalResepsi != null
              ? DateFormat('yyyy-MM-dd').format(tanggalResepsi!)
              : '',
          'jamResepsi': jamResepsi != null ? _formatTimeOfDay(jamResepsi!) : '',
          'namaDikhitan': namaDikhitan ?? '',
          'namaOrangTua': namaOrangTua ?? '',
          'tanggalAcara': tanggalAcara != null
              ? DateFormat('yyyy-MM-dd').format(tanggalAcara!)
              : '',
          'jamAcara': jamAcara != null ? _formatTimeOfDay(jamAcara!) : '',
          'lokasiAcara': lokasiAcara ?? '',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == 'success') {
          // Handle success
          print('Data successfully saved.');
          // Navigate to the next page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PackageSelectionPage()),
          );
        } else {
          // Handle error
          print('Error saving data: ${responseData['message']}');
          _showErrorDialog(
              'Error', 'Failed to save data: ${responseData['message']}');
        }
      } else {
        // Handle HTTP error
        print('HTTP error ${response.statusCode}');
        _showErrorDialog(
            'Error', 'HTTP error ${response.statusCode}. Please try again.');
      }
    } catch (e) {
      // Handle network or unexpected errors
      print('Exception caught: $e');
      _showErrorDialog(
          'Error', 'An unexpected error occurred. Please try again.');
    }
  }

  // Helper function to format TimeOfDay to HH:mm format
  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.Hm().format(dateTime);
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

  void _updateButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Data'),
        backgroundColor: Color(0xFFE1BEE7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            onChanged: _updateButtonState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Silahkan isi detail acara!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Form fields based on category
                if (widget.undangan['category'] == 'Wedding')
                  _buildWeddingFormFields()
                else if (widget.undangan['category'] == 'Khitan')
                  _buildKhitanFormFields(),
                SizedBox(height: 16),
                // Submit button
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _formKey.currentState?.validate() ?? false
                              ? Colors.purple
                              : Colors.grey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        _submitForm(); // Call the function to save form data
                      }
                    },
                    child: Text('Lanjut'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to build Wedding form fields
  Widget _buildWeddingFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextFormField(
            'Nama Mempelai Wanita', (value) => namaMempelaiWanita = value),
        _buildTextFormField(
            'Orang Tua (Wanita)', (value) => orangTuaWanita = value),
        _buildTextFormField('Anak Ke-', (value) => anakKeWanita = value),
        _buildTextFormField(
            'Nama Mempelai Pria', (value) => namaMempelaiPria = value),
        _buildTextFormField(
            'Orang Tua (Pria)', (value) => orangTuaPria = value),
        _buildTextFormField('Anak Ke-', (value) => anakKePria = value),
        _buildDateTimeFormField('Tanggal Akad', Icons.calendar_today,
            (value) => tanggalAkad = value),
        _buildTimePickerFormField(
            'Jam Akad', Icons.access_time, (value) => jamAkad = value,
            controller: jamAkadController),
        _buildDateTimeFormField('Tanggal Resepsi', Icons.calendar_today,
            (value) => tanggalResepsi = value),
        _buildTimePickerFormField(
            'Jam Resepsi', Icons.access_time, (value) => jamResepsi = value,
            controller: jamResepsiController),
        _buildTextFormField('Lokasi Acara', (value) => lokasiAcara = value),
      ],
    );
  }

  // Method to build Khitan form fields
  Widget _buildKhitanFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextFormField(
            'Nama yang dikhitan', (value) => namaDikhitan = value),
        _buildTextFormField('Nama Orang Tua', (value) => namaOrangTua = value),
        _buildDateTimeFormField('Tanggal Acara', Icons.calendar_today,
            (value) => tanggalAcara = value),
        _buildTimePickerFormField(
            'Jam Acara', Icons.access_time, (value) => jamAcara = value,
            controller: jamAcaraController),
        _buildTextFormField('Lokasi Acara', (value) => lokasiAcara = value),
      ],
    );
  }

  // Generic method to build a text form field
  Widget _buildTextFormField(String label, Function(String?)? onSaved,
      {bool required = true}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (required && (value == null || value.isEmpty)) {
          return 'Field ini wajib diisi';
        }
        return null;
      },
      onSaved: onSaved,
      onChanged: (value) => _updateButtonState(),
    );
  }

  // Generic method to build a date-time form field
  Widget _buildDateTimeFormField(
      String label, IconData icon, Function(DateTime?) onSaved) {
    return Row(
      children: [
        Expanded(
          child: InputDecorator(
            decoration: InputDecoration(labelText: label),
            child: Text(tanggalAkad != null
                ? DateFormat('yyyy-MM-dd').format(tanggalAkad!)
                : ''),
          ),
        ),
        IconButton(
          icon: Icon(icon),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              setState(() {
                tanggalAkad = pickedDate;
              });
              onSaved(pickedDate);
            }
          },
        ),
      ],
    );
  }

  // Generic method to build a time picker form field
  Widget _buildTimePickerFormField(
      String label, IconData icon, Function(TimeOfDay?) onSaved,
      {TextEditingController? controller}) {
    return Row(
      children: [
        Expanded(
          child: InputDecorator(
            decoration: InputDecoration(labelText: label),
            child: Text(controller != null ? controller.text : ''),
          ),
        ),
        IconButton(
          icon: Icon(icon),
          onPressed: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (pickedTime != null) {
              controller?.text = pickedTime.format(context);
              setState(() {
                jamAkad = pickedTime;
              });
              onSaved(pickedTime);
            }
          },
        ),
      ],
    );
  }
}
