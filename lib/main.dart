import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _sentenceController = TextEditingController();

  String _result = '';

  bool isPalindrome(String input) {
    input = input.replaceAll(' ', '').toLowerCase();

    for (int i = 0; i < input.length ~/ 2; i++) {
      if (input[i] != input[input.length - 1 - i]) {
        return false;
      }
    }

    return true;
  }

  void checkPalindrome() {
    String name = _nameController.text;
    String sentence = _sentenceController.text;

    _nameController.clear();
    _sentenceController.clear();

    bool isPalindrom = isPalindrome(sentence);

    setState(() {
      _result = isPalindrom ? 'isPalindrome' : 'bukan palindrom';
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil'),
          content: Text('$name, $_result.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background 1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white.withOpacity(0.7),
                  child: Icon(
                    Icons.person_add_alt_1_rounded,
                    size: 30,
                    color: Colors.white,
                  )),
              SizedBox(height: 50), // Jarak antara avatar dan text field
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 187, 110, 110)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                            fontSize: 14)),
                  )),

              Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
                  child: TextField(
                    controller: _sentenceController,
                    decoration: InputDecoration(
                      hintText: 'Palindrome',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 14
                          // Ganti dengan warna yang diinginkan
                          // Ganti dengan gaya font yang diinginkan
                          ),
                    ),
                  )),
              SizedBox(height: 50), // Jarak antara text field dan button
              ElevatedButton(
                  onPressed: checkPalindrome,
                  child: Text(
                    'CHECK',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(320, 45)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(
                          (0xFF2B637B),
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )))),
              SizedBox(height: 15), // Jarak antara dua button
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => NextPage(
                        //   selectedName: '',
                        // ),
                        builder: (context) =>
                            NextPage(selectedName: _nameController.text),
                      ),
                    );
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(320, 45)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(
                          (0xFF2B637B),
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )))),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String selectedName;

  const NextPage({Key? key, required this.selectedName}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState(selectedName);
}

class _NextPageState extends State<NextPage> {
  String selectedName = '';
  _NextPageState(this.selectedName);

  @override
  void initState() {
    super.initState();
    selectedName = widget.selectedName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF2B637B),
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    selectedName.isNotEmpty ? selectedName : 'John Doe',
                    // 'John Doe', //nama pengguna
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Selected User Name',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdPage(
                                  onNameSelected: (name) {
                                    // Perbarui selectedName
                                    setState(() {
                                      selectedName = name;
                                    });
                                  },
                                )));
                  },
                  child: Text(
                    'Choose a User',
                    style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                  ),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(320, 45)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(
                          (0xFF2B637B),
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )))),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  final Function(String) onNameSelected;

  const ThirdPage({Key? key, required this.onNameSelected}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final ScrollController _scrollController = ScrollController();
  final List<String> names = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Sarah Williams',
  ];
  final List<String> email = [
    'Johndoe@gmail.com',
    'Janesmith@gmail.com',
    'Michaeljohnson@gmail.com',
    'Sarahwilliams@gmail.com',
  ];
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Call the function to load the next page here
      // Example: _loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          centerTitle: true,
          title: Text(
            'Third Screen',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF2B637B),
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              // Panggil fungsi untuk menyegarkan halaman di sini
              // contoh: _refreshPage();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Panggil fungsi onNameSelected dengan nama yang dipilih
                      widget.onNameSelected(names[index]);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/3-image 1.png'),
                        // child: Text(
                        //   names[index][0],
                        // ),
                      ),
                      title: Text(names[index],
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      subtitle: Text(email[index],
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          )),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                      height: 2.0,
                    ),
                  );
                },
              ),
            )));
  }
}
