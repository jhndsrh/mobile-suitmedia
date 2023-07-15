import 'package:flutter/material.dart';
import 'package:mobile_developer_suitmedia/second_screen.dart';

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
              SizedBox(height: 50),
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
                          fontSize: 14),
                    ),
                  )),
              SizedBox(height: 50),
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
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
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
