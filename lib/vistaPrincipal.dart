import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:semana13_2_moor_m/database/database.dart';
import 'package:semana13_2_moor_m/vistaNuevo.dart';

class vistaPrincipal extends StatefulWidget {
  const vistaPrincipal({Key? key}) : super(key: key);

  @override
  State<vistaPrincipal> createState() => _vistaPrincipalState();
}

class _vistaPrincipalState extends State<vistaPrincipal> {

  @override
  Widget build(BuildContext context) {

    final database=AppDatabase(NativeDatabase.memory());

    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Usuarios'),
      ),
      body: FutureBuilder<List<User>>(
        future: database.getListsUsers(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<User>? userList=snapshot.data;
            return ListView.builder(
                itemCount: userList!.length,
                itemBuilder: (context, index){
                  User userData=userList[index];
                  return ListTile(
                    title: Text(userData.nombre),
                    subtitle: Text(userData.correo),
                  );
                }
                );
          }else if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else{
            return Center(
              child: Text(''),
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _nuevoUser();
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),



    );
  }

  void _nuevoUser() async{
    var res=await Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const vistaNuevo(),));
    if(res!=null && res==true){
      setState(() {

      });
    }
  }

}

















