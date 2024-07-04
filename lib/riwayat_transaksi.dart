import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionHistoryPage extends StatefulWidget {
  @override
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  List<Map<String, dynamic>> _transactions = [];
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2/triinvite/get_transactions.php'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        // Log the data received from API
        print("Data received from API: $data");
        setState(() {
          _transactions = data.cast<Map<String, dynamic>>();
        });
      } else {
        throw Exception('Failed to load transactions: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching transactions: $e');
      _showErrorSnackBar('Failed to fetch transactions');
    }
  }

  Future<void> _deleteTransaction(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('http://10.0.2.2/triinvite/delete_transaction.php?id=$id'),
      );
      if (response.statusCode == 200) {
        _fetchTransactions(); // Refresh transaction list
        _showSuccessSnackBar('Transaction deleted successfully');
      } else {
        throw Exception('Failed to delete transaction: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting transaction: $e');
      _showErrorSnackBar('Failed to delete transaction');
    }
  }

  void _showSuccessSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showErrorSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      appBar: AppBar(
        title: Text('Transaction History'),
        backgroundColor: Color(0xFFE1BEE7),
      ),
      body: _transactions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                // Log each transaction to debug
                print("Transaction: $transaction");
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                        transaction['selectedpackage'] ?? 'Data not available'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Package Price: ${transaction['packageprice'] ?? 'Data not available'}'),
                        Text(
                            'Payment Method: ${transaction['payment_method'] ?? 'Data not available'}'),
                        Text(
                            'Transaction Date: ${transaction['created_at'] ?? 'Data not available'}'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TransactionDetailPage(transaction),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Delete Transaction?'),
                            content: Text(
                                'Are you sure you want to delete this transaction?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: Text('Delete'),
                                onPressed: () {
                                  _deleteTransaction(
                                      int.parse(transaction['id']));
                                  Navigator.pop(context); // Close dialog
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
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
          switch (index) {
            case 0:
              Navigator.pop(context);
              break;
            case 1:
              Navigator.pushNamed(context, '/riwayat_transaksi');
              break;
            case 2:
              Navigator.pushNamed(context, '/customer_service');
              break;
          }
        },
      ),
    );
  }
}

class TransactionDetailPage extends StatelessWidget {
  final Map<String, dynamic> transaction;

  TransactionDetailPage(this.transaction);

  Future<void> _deleteTransaction(BuildContext context, int id) async {
    try {
      final response = await http.delete(
        Uri.parse('http://10.0.2.2/triinvite/delete_transaction.php?id=$id'),
      );
      if (response.statusCode == 200) {
        Navigator.pop(context); // Close detail page
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transaction deleted successfully')),
        );
      } else {
        throw Exception('Failed to delete transaction: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting transaction: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete transaction'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Detail'),
        backgroundColor: Color(0xFFE1BEE7),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Delete Transaction?'),
                  content:
                      Text('Are you sure you want to delete this transaction?'),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text('Delete'),
                      onPressed: () {
                        _deleteTransaction(
                            context, int.parse(transaction['id']));
                        Navigator.pop(context); // Close dialog
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Selected Package: ${transaction['selectedpackage'] ?? 'Data not available'}'),
            SizedBox(height: 8),
            Text(
                'Package Price: ${transaction['packageprice'] ?? 'Data not available'}'),
            SizedBox(height: 8),
            Text(
                'Payment Method: ${transaction['payment_method'] ?? 'Data not available'}'),
            SizedBox(height: 8),
            Text(
                'Transaction Date: ${transaction['created_at'] ?? 'Data not available'}'),
          ],
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
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case 1:
              // Stay on the same page, no action needed
              break;
            case 2:
              Navigator.pushNamed(context, '/customer_service');
              break;
          }
        },
      ),
    );
  }
}
