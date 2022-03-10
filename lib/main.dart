import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _iconAnimation;
  late AnimationController _iconAnimationController;
  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() {});
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage("assets/girl.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Theme(
            data: ThemeData(
              primarySwatch: Colors.teal,
              accentColor: Colors.white,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 25,
                ),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: _iconAnimation.value * 140.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(40.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Enter Email",
                                  labelStyle: TextStyle(color: Colors.white),
                                  fillColor: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Enter Password",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  fillColor: Colors.white),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                            ),
                            new MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.teal,
                              splashColor: Colors.tealAccent,
                              textColor: Colors.white,
                              child: Icon(Icons
                                  .forward), // Icon(FontAwesomeIcons.signInAlt),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
