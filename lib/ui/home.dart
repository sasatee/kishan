import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();

  bool checkboxValueA = false;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  int radioValue = 0;
  bool switchValue = false;
  double _finalResult = 0.0;
  String _planetName = "";

  void handleRadioValueChanged(int? value) {
    if (value != null) {
      setState(() {
        radioValue = value;
        switch (radioValue) {
          case 0:
            _finalResult = calculateWeight(_weightController.text, 0.06);
            _planetName =
                "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
            break;
          case 1:
            _finalResult = calculateWeight(_weightController.text, 0.38);
            _planetName =
                "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
            break;
          case 2:
            _finalResult = calculateWeight(_weightController.text, 0.91);
            _planetName =
                "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
            break;
          case 3:
            _finalResult = calculateWeight(_weightController.text, 1.06);
            _planetName =
                "Your weight on Saturn is ${_finalResult.toStringAsFixed(1)}";
            break;
          case 4:
            _finalResult = calculateWeight(_weightController.text, 1.19);
            _planetName =
                "Your weight on Neptune is ${_finalResult.toStringAsFixed(1)}";
            break;
          default:
            print("Nothing selected!");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            SizedBox(height: 30),
            new Image.asset(
              'images/planet.png',
              height: 100.0,
              width: 100.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.topCenter,
              child: new Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Your Weight on Earth',
                        hintText: 'In pounds',
                        icon: new Icon(Icons.person_outline),
                      ),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged,
                        ),
                      ),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.black),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged,
                        ),
                      ),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.black),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged,
                        ),
                      ),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.black),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Radio<int>(
                          activeColor: Colors.lightBlue,
                          value: 3,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged,
                        ),
                      ),
                      new Text(
                        "Saturn",
                        style: new TextStyle(color: Colors.black),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Radio<int>(
                          activeColor: Colors.blue,
                          value: 4,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged,
                        ),
                      ),
                      new Text(
                        "Neptune",
                        style: new TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.0)),
                  new Text(
                    _weightController.text.isEmpty
                        ? "Please enter weight"
                        : _planetName + " lbs",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.38;
    }
  }
}
