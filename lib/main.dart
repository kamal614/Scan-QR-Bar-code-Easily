import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner_example/page/qr_create_page.dart';
import 'package:qr_code_scanner_example/page/qr_scan_page.dart';
import 'package:qr_code_scanner_example/widget/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'QR Code Scanner';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          title: Padding(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Image.asset(
                      "assets/icon.png",
                      height: 30,
                      width: 44,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                SizedBox(
                  width: 75,
                ),
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),

          titleSpacing: 0,
          // centerTitle: true,
        ),
        drawer: Drawer(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: new DecorationImage(
                              image: AssetImage("assets/qr2.jpeg"),
                              fit: BoxFit.cover)),
                    ),
                    // DrawerHeader(
                    //   child: Column(
                    //     // crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: <Widget>[
                    //       Text(
                    //         'John Doe',
                    //       ),
                    //     ],
                    //   ),
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage("assets/qr2.jpeg"),
                    //         fit: BoxFit.cover),
                    //   ),
                    // ),
                    ListTile(
                      title: Text(
                        'Create QR Code',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      leading: Icon(
                        Icons.qr_code,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => QRCreatePage(),
                        ));
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Scan QR Code',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      leading: Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => QRScanPage(),
                        ));
                      },
                    ),

                    ListTile(
                      title: InkWell(
                        child: Text(
                          'About Developer',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        onTap: () => launch('https://github.com/kamal614'),
                      ),
                      leading: Icon(
                        Icons.people,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onTap: () {
                        //todo
                      },
                    ),
                    ListTile(
                      title: InkWell(
                        child: Text(
                          'Connect on LinkedIn',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        onTap: () =>
                            launch('https://www.linkedin.com/in/kamal614/'),
                      ),
                      leading: Icon(
                        Icons.add,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
                Container(
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Column(
                          children: <Widget>[
                            Divider(),
                            Center(
                              child: new InkWell(
                                child: new Text(
                                  "This app is open source and the Source code can be found at GitHub",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () =>
                                    launch('https://github.com/kamal614'),
                              ),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/qr.gif",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "What do you want to do today?",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SizedBox(
                height: 30.0,
              ),
              ButtonWidget(
                text: 'Create QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRCreatePage(),
                )),
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                text: 'Scan QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRScanPage(),
                )),
              ),
            ],
          ),
        ),
      );
}
