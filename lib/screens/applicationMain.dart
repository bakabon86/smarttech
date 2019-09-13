import 'package:flutter/material.dart';

class ApplicationMain extends StatefulWidget {
  GalihApp createState() => GalihApp();
}

class GalihApp extends State<ApplicationMain> {
  int selectedNavBar = 0;
  List<String> lsDropDown = ['one', 'two', 'three'];
  List<String> lsImage = [
    "https://image.shutterstock.com/image-illustration/3d-building-600w-110160008.jpg",
    "https://image.shutterstock.com/image-vector/smart-city-isometric-illustration-intelligent-260nw-1108498157.jpg",
    "https://image.shutterstock.com/image-vector/isometric-future-city-real-estate-600w-1056765911.jpg",
  ];
  String selectedValued;

  Widget bottomIconNav(IconData icon, String txtStr, int index,
          {Function callbackBtn}) =>
      InkWell(
        onTap: () {
          selectedNavBar = index;
          setState(() {
            if (callbackBtn != null) callbackBtn();
          });
        },
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 2,
                      color: selectedNavBar == index
                          ? Colors.black
                          : Colors.tealAccent[700]),
                ),
                child: Icon(icon,
                    color: selectedNavBar == index
                        ? Colors.black
                        : Colors.tealAccent[700]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(txtStr),
              )
            ],
          ),
        ),
      );

  Widget bottomNavbarButton(
          IconData icon, String txtStr, Function callBackBtn) =>
      InkWell(
        onTap: () {
          callBackBtn();
        },
        // child: Container(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.min,
        //     children: <Widget>[
        //       Icon(icon),
        //       Text(txtStr),
        //     ],
        //   ),
        // ),
      );

  Widget makeRaisedButton(IconData icon, String txtStr) => InkWell(
      focusColor: Colors.blueGrey,
      onTap: () {},
      child: Container(
        width: 110,
        height: 110,
        child: Card(
          // color: Colors.blueAccent,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Icon(
                  icon,
                  size: 37.0,
                  color: Colors.tealAccent[700],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  txtStr,
                  style: TextStyle(fontSize: 15.0),
                ),
              )
            ],
          ),
        ),
      ));

  Widget makeImageCarrousel(List<String> ls) => Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            color: Colors.black),
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: lsImage.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Image.network(
                          ls[index].toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 2,
                        bottom: 1,
                        child: ListTile(
                          title: Text(
                            'Awesome image',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Awesome image caption',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'SedayuOne',
              style: TextStyle(
                  color: Colors.tealAccent[700],
                  fontWeight: FontWeight.w900,
                  fontSize: 21.0),
            ),
            DropdownButton(
              value: selectedValued,
              items: lsDropDown
                  .map((x) => DropdownMenuItem(child: Text(x), value: x))
                  .toList(),
              onChanged: (String value) {
                setState(() {
                  selectedValued = value;
                });
              },
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // Expanded(
          //   child: Placeholder(
          //     fallbackHeight: MediaQuery.of(context).size.height *3,
          //   ),
          // ),
          makeImageCarrousel(lsImage),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  makeRaisedButton(Icons.work, 'Tagihan'),
                  SizedBox(height: 10),
                  makeRaisedButton(Icons.warning, 'Darurat'),
                ],
              ),
              Column(
                children: <Widget>[
                  makeRaisedButton(Icons.video_label, 'Keluhan'),
                  SizedBox(height: 10),
                  makeRaisedButton(Icons.new_releases, 'Berita'),
                ],
              ),
            ],
          )
        ],
      ),

      //function
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              bottomIconNav(Icons.home, 'Home', 1),
              bottomIconNav(Icons.list, 'Aktifitas', 2),
              bottomIconNav(Icons.notifications_none, 'Notifikasi', 3),
              bottomIconNav(Icons.home, 'Profil', 4), 
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: selectedNavBar,
      //     onTap: (int index) {
      //       selectedNavBar = index;
      //       setState(() {});
      //     },
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home), title: Text("Beranda")),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.accessible), title: Text("Beranda")),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.people), title: Text("Beranda")),
      //     ])
      //  child: child,
    );
  }
}
