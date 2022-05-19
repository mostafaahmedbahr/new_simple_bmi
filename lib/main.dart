import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  double result=0;
  String textResult="";
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: Text("Bmi Calculator",
          style: TextStyle(
            fontSize: 30,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value){
                    heightController.text=value;
                  },
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: heightController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 5,
                      ),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 5,
                      ),
                    ) ,
                    hintText: "Height in M",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: Icon(Icons.height,color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value){
                    weightController.text=value;
                  },
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: weightController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 5,
                      ),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 5,
                      ),
                    ) ,
                    hintText: "Weight in Kg",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: Icon(Icons.line_weight_outlined,color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                height: 60,
                width: 200,
                child: RaisedButton(
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                    onPressed: (){
                    double h=double.parse(heightController.text);
                    double w=double.parse(weightController.text);
                    setState(() {
                      result=(w/(h*h));
                      if(result<=18.5){
                        textResult="Underweight";
                      }
                      else if(result>18.5&&result<=25){
                        textResult="Healthy Weight";
                      }
                      else if(result>25&&result<=30){
                        textResult="Overweight";
                      }
                      else{
                        textResult="Obese";
                      }
                    });
                    },
                  color: Colors.deepOrange,
                  child: Text("Calculate",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),),
                ),
              ),
              SizedBox(height: 40,),
              Container(
               height: 250,
               width: 250,
               decoration: BoxDecoration(
                 boxShadow: [
                   BoxShadow(
                     blurRadius: 10,
                     color: Colors.deepOrange,
                     spreadRadius: 5,
                   ),
                 ],
                 color: Colors.blueGrey[900],
                 borderRadius: BorderRadius.circular(10),
               ),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${result.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("you are ",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(textResult,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
