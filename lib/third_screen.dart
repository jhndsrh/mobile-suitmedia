import 'package:flutter/material.dart';

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
        !_scrollController.position.outOfRange) {}
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
              Navigator.pop(context);
            },
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () async {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      widget.onNameSelected(names[index]);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/3-image 1.png'),
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
