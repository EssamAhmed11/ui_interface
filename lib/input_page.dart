import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kActiveColor = Colors.grey;
const kInactiveColor = Colors.teal;
enum GenderType { Male, Female }
const ColorInterface = Color(0xff1EAED1);

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GenderType selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InputField(hintText: 'اسم المشترك'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '+996',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InputField(hintText: 'رقم الهاتف'),
              ],
            ),
            InputField(hintText: 'البريد الالكترونى'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RoundIconButton(
                      colour: selectedGender == GenderType.Male
                          ? kInactiveColor
                          : kActiveColor,
                      onPressed: () {
                        setState(() {
                          print('Male button was pressed');
                          selectedGender == GenderType.Male;
                        });
                      },
                    ),
                    Text('ذكر'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    RoundIconButton(
                      colour: selectedGender == GenderType.Female
                          ? kInactiveColor
                          : kActiveColor,
                      onPressed: () {
                        setState(() {
                          print('Female button was pressed');
                          selectedGender == GenderType.Female;
                        });
                      },
                    ),
                    Text('أثنى'),
                  ],
                ),
              ],
            ),
            InputField(hintText: 'كلمة المرور'),
            InkWell(
              child: Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Material(
                    color: ColorInterface,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                        child: Text(
                      "تسجـــيل",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
              ),
              onTap: () {
                print('registeration button clicked');
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text('الموافقة على الشروط والأحكام'),
              RoundIconButton(),
            ])
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;

  const InputField({Key key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: MediaQuery.of(context).size.width * .75,
      child: TextField(
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
        textAlignVertical: TextAlignVertical.center,
        maxLines: 1,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(),
          hintStyle: TextStyle(
            color: Colors.green,
          ),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Color colour;
  final Function onPressed;

  RoundIconButton({this.onPressed, this.colour});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(Icons.check),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 30,
        height: 30,
      ),
      shape: CircleBorder(),
      fillColor: colour,
    );
  }
}
