import 'package:flutter/material.dart';
import 'package:mobile_developer_suitmedia/third_screen.dart';

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
            Navigator.pop(context);
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
