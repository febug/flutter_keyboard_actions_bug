import "package:flutter/material.dart";
import "package:keyboard_actions/keyboard_actions.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("xx"),
          ),
          body: FormKeyboardActions(
              child: MyHomePage(title: "Flutter Demo Home Page"))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode _nodeText1 = FocusNode();

  @override
  void initState() {
    FormKeyboardActions.setKeyboardActions(context, _buildConfig(context));

    // Expected behavior
    //    _nodeText1.addListener(() {
    //      if (_nodeText1.hasFocus == false) {
    //        _nodeText1.unfocus();
    //      }
    //    });

    super.initState();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: false,
      actions: [
        KeyboardAction(
          focusNode: _nodeText1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              focusNode: _nodeText1,
              decoration: InputDecoration(
                hintText: "1. Tap me",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Text("2. Then Tap me"),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (build) {
                            return ListView(
                              children: <Widget>[
                                ListTile(
                                  title: Text("Tap anywhere"),
                                ),
                                ListTile(
                                  title:
                                      Text("You can see actions bar not hide"),
                                ),
                                ListTile(
                                    title: Text(
                                  'Hint :',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                                ListTile(
                                  title: Text(
                                      "You can uncomment the code in initState"),
                                ),
                                ListTile(
                                  title: Text("to see expected behavior"),
                                )
                              ],
                            );
                          });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
