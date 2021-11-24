import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  String dropdownValue = '';
  File file;
  String path_foto = 'Tire uma foto';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criação de Crachás", textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              path_foto,
            ),
            SizedBox(
              height: 20,
            ),
            file != null
                ? Image.file(file)
                : Image.asset(
                    "assets/images/camera.png",
                    height: 100,
                  ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: (){
                    _getImagemFromCamera();
                  },
                  child: Text("Camera ",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.purple,
                    
                  ))),
                  Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: (){
                    _getImagemFromGaleria();
                  },
                  child: Text(" Galeria",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.purple,
                ))),
                //Column(
                 //Column/   children: [
                  //    Text("Nome"),
                   //   _campo("Digite seu nome", nameController),
                    //  Text("Area"),
                  //    _dropdownArea()
                 // ],)
                ]),
            ),
            Text("Nome", style: TextStyle(color: Colors.black, fontSize: 25.0)),
            _campo("Digite seu nome", nameController),
            Text("Area", style: TextStyle(color: Colors.black, fontSize: 25.0)),
          _dropdownArea()],
            
              ),
            ),
        );
  }
 
  void _getImagemFromCamera() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.camera);
 
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }
 
  void _getImagemFromGaleria() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.gallery);
 
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }
   _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: objController,
    );
  }
  _dropdownArea() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black,fontSize: 25.0),
      underline: Container(
        height: 0.5,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['','Tecnologia', 'Gestão', 'Admnistração']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  
}
