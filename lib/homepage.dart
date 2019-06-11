import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _formKey = GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();


  var _cur = ["Rupees","Dolars","Pound","Dinar","Euro"];
  String _currentitem = "Rupees";
  var _displayresult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Interest Calculator",style: TextStyle(fontSize: 25.0),),),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(25.0),
          children: <Widget>[
            image(),
            Padding(
              padding: EdgeInsets.only(top:25.0),
              child: TextFormField(
                style:TextStyle(fontSize: 25.0),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Principal",
                  hintText: "Example like 12000",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 20.0
                  ),
                ),
                controller: principalController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:12.0),
              child: TextFormField(
                style:TextStyle(fontSize: 25.0),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Rate of Interest",
                  hintText: "In percent",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 20.0
                  ),
                ),
                controller: roiController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:12.0),
              child: Row(
                children: <Widget>[
              Expanded(
                child: TextFormField(
                  style:TextStyle(fontSize: 25.0),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Term",
                    hintText: "In months",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 20.0
                    )
                   ),
                   controller: termController,
                  ),
              ),
              Padding(padding: EdgeInsets.only(left: 10.0),),
              Expanded(
                child: DropdownButton(
                  items: _cur.map((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child:Text(value,style: TextStyle(fontSize: 25.0),),
                    );
                  }).toList(),
                  value:_currentitem,
                  onChanged: (String newValueSelected){
                    _onDropdownItemSelected(newValueSelected);
                  },
                ),
              )
               ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                     Expanded(
                      child:ButtonTheme(
                        minWidth: 50.0,
                        height: 50.0,
                        child: RaisedButton(
                          child:Text("Calculate",style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold)),
                          onPressed: (){
                            setState(() {
                              this._displayresult = getresult();
                            });
                          },
                        ),
                      )
                    ),
                    Expanded(
                      child:ButtonTheme(
                        buttonColor: Colors.pink[200],
                        minWidth: 50.0,
                        height: 50.0,
                        child: RaisedButton(
                          child:Text("Reset",style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold)),
                          onPressed: (){
                            setState(() {
                             reset(); 
                            });
                          },
                        ),
                      )
                    ),
                ],
              ),  
            ),
            Padding(
              padding: EdgeInsets.only(top:15.0),
              child: Text(this._displayresult,style:TextStyle(fontSize: 20.0)),
            )
          ],
        ),
      ),
    );
  }
  Widget image(){
    AssetImage assetImage = AssetImage("asset/1.jpeg");
    Image image = Image(
      image: assetImage,
      width: 130.0,
      height: 130.0,
    );
    return Container(child: image,);
  }
  void _onDropdownItemSelected(String newValueSelected){
    setState(() {
     this._currentitem = newValueSelected; 
    });
  }
  String getresult(){
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable $_currentitem';

     return result;   
  }
  void reset(){
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    _displayresult = "";
    _currentitem = "Rupees";
  }
}
