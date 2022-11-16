import 'package:drift/native.dart';
import 'package:semana13_2_moor_m/database/database.dart';
import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';

class vistaNuevo extends StatefulWidget {
  const vistaNuevo({Key? key}) : super(key: key);

  @override
  State<vistaNuevo> createState() => _vistaNuevoState();
}

class _vistaNuevoState extends State<vistaNuevo> {

  late TextEditingController txtNombre;
  late TextEditingController txtCorreo;

  @override
  void initState() {
    txtNombre=TextEditingController();
    txtCorreo=TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final database=AppDatabase(NativeDatabase.memory());

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
        ),
        title: Text('Nuevos Usuarios'),
      ),

      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [


              TextFormField(
                controller: txtNombre,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Ingresar Nombre: '
                ),
              ),

            SizedBox(
              height: 20,
            ),


              TextFormField(
                controller: txtCorreo,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Ingresar Correo: '
                ),
              ),

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: (){
                    database.insertUser(UsersCompanion(
                      nombre: dr.Value(txtNombre.text),
                      correo: dr.Value(txtCorreo.text),
                    )).then((value) {
                      Navigator.pop(context,true);
                    });
                  }, child: Text('Grabar Usuario')),

            ],
          ),
        ),
      ),

    );
  }
}









