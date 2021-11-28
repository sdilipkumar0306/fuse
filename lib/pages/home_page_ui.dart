import 'package:flutter/material.dart';
import 'package:fuse/util/widgets.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 20,
          child: MyButton(
            child: const MyText("text"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MainHomePage4()));
            },
          ),
        ),
      ),
    );
  }
}

class MainHomePage1 extends StatefulWidget {
  const MainHomePage1({Key? key}) : super(key: key);

  @override
  _MainHomePage1State createState() => _MainHomePage1State();
}

class _MainHomePage1State extends State<MainHomePage1> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 20,
          child: Text(
            "bbbbbbbbbbbbbb ",
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class MainHomePage2 extends StatefulWidget {
  const MainHomePage2({Key? key}) : super(key: key);

  @override
  _MainHomePage2State createState() => _MainHomePage2State();
}

class _MainHomePage2State extends State<MainHomePage2> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 20,
          child: Text(
            "cccccccccccccc",
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class MainHomePage3 extends StatefulWidget {
  const MainHomePage3({Key? key}) : super(key: key);

  @override
  _MainHomePage3State createState() => _MainHomePage3State();
}

class _MainHomePage3State extends State<MainHomePage3> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 20,
          child: Text(
            "ddddddddddddddddd",
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class MainHomePage4 extends StatefulWidget {
  const MainHomePage4({Key? key}) : super(key: key);

  @override
  _MainHomePage4State createState() => _MainHomePage4State();
}

class _MainHomePage4State extends State<MainHomePage4> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "eeeeeeeeeeeeeeee ",
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 100,
          height: 20,
          child: Text(
            "eeeeeeeeeeeeeeee ",
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
