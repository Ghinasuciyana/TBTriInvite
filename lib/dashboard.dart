import 'package:flutter/material.dart';
import 'detail_undangan_page.dart'; // Import file detail_undangan_page.dart

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedCategory = 'Semua kategori';
  String searchQuery = '';

  final List<Map<String, String>> invitations = [
    {
      'category': 'Wedding',
      'name': 'Undangan Pernikahan 1',
      'image':
          'https://www.cepetnikah.com/wp-content/uploads/2020/01/undangan-pernikahan-digital-jadi.jpeg'
    },
    {
      'category': 'Wedding',
      'name': 'Undangan Pernikahan 2',
      'image':
          'https://bagvania.b-cdn.net/wp-content/uploads/2022/10/Free-7-Happy-Bouquet-Canva-Wedding-Invitation-Templates-1-360x504.jpg'
    },
    {
      'category': 'Wedding',
      'name': 'Undangan Pernikahan 3',
      'image':
          'https://d3p0dms4feb86l.cloudfront.net/media/bi/7510/fancy-chalkboard-wedding-invitations-l.jpg'
    },
    {
      'category': 'Wedding',
      'name': 'Undangan Pernikahan 4',
      'image':
          'https://marketplace.canva.com/EAFF7h2ltpc/1/0/1135w/canva-peach-dan-pink-pastel-elegan-dan-modern-undangan-pernikahan-VwKfXwjbPv0.jpg'
    },
    {
      'category': 'Wedding',
      'name': 'Undangan Pernikahan 5',
      'image':
          'https://marketplace.canva.com/MADLhcl0uQE/3/0/thumbnail_large/canva-ivory-and-green-tropical-leaves-wedding-invitation-MADLhcl0uQE.jpg'
    },
    {
      'category': 'Khitan',
      'name': 'Undangan Khitan 1',
      'image':
          'https://ikampus.my.id/wp-content/uploads/2022/03/download-template-undangan-khitanan-ppt.jpg'
    },
    {
      'category': 'Khitan',
      'name': 'Undangan Khitan 2',
      'image':
          'https://marketplace.canva.com/EAFHNoKm2fQ/1/0/1600w/canva-hijau-ornamen-muslim-undangan-tasyakuran-khitan-YbuSdSrspok.jpg'
    },
    {
      'category': 'Khitan',
      'name': 'Undangan Khitan 3',
      'image':
          'https://4.bp.blogspot.com/-kc4cuo1AF70/UmuUjKdFwAI/AAAAAAAAAAs/cBhjgrUYrkI/s1600/undangan.jpg'
    },
    {
      'category': 'Khitan',
      'name': 'Undangan Khitan 4',
      'image':
          'https://ecs7.tokopedia.net/img/cache/700/product-1/2018/4/10/0/0_ef3bf811-1e29-4091-b8e3-d9b40e7a917b_950_1280.jpg'
    },
    {
      'category': 'Khitan',
      'name': 'Undangan Khitan 5',
      'image':
          'https://bloggersiana.com/wp-content/uploads/2022/08/20-contoh-undangan-khitan-lewat-wa_580bb9112.jpg'
    },
  ];

  List<Map<String, String>> getFilteredInvitations() {
    List<Map<String, String>> filteredInvitations = invitations;

    if (selectedCategory != 'Semua kategori') {
      filteredInvitations = invitations
          .where((invitation) => invitation['category'] == selectedCategory)
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      filteredInvitations = filteredInvitations
          .where((invitation) => invitation['name']!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    }

    return filteredInvitations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TriInvite'),
        backgroundColor: Color(0xFFE1BEE7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFE1BEE7),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'TriInvite',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari undangan...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search, color: Color(0xFF9575CD)),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == 'Semua kategori'
                        ? Color(0xFF9575CD)
                        : Color(0xFFE1BEE7),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Semua kategori';
                    });
                  },
                  child: Text('Semua kategori'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == 'Wedding'
                        ? Color(0xFF9575CD)
                        : Color(0xFFE1BEE7),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Wedding';
                    });
                  },
                  child: Text('Wedding'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCategory == 'Khitan'
                        ? Color(0xFF9575CD)
                        : Color(0xFFE1BEE7),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Khitan';
                    });
                  },
                  child: Text('Khitan'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: getFilteredInvitations().length,
                itemBuilder: (context, index) {
                  final invitation = getFilteredInvitations()[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailUndanganPage(undangan: invitation),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.network(
                              invitation['image']!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            invitation['category']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9575CD),
                            ),
                          ),
                          Text(
                            invitation['name']!,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
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
              // Jika indeks 0 (Home) ditekan, tidak melakukan apa pun karena sudah berada di halaman ini.
              break;
            case 1:
              Navigator.pushNamed(context,
                  '/riwayat_transaksi'); // Menuju ke halaman riwayat transaksi
              break;
            case 2:
              Navigator.pushNamed(context,
                  '/customer_service'); // Menuju ke halaman customer service
              break;
          }
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> invitation;

  DetailPage({required this.invitation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Undangan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              invitation['image']!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              invitation['category']!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9575CD),
              ),
            ),
            Text(
              invitation['name']!,
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
