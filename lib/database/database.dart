import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Users extends Table{
  IntColumn get id=>integer().autoIncrement()();
  TextColumn get nombre=>text().named('nombre')();
  TextColumn get correo=>text().named('correo')();
}

LazyDatabase abrirConeccion(){
  return LazyDatabase(() async{
    final dbFolder=await getApplicationDocumentsDirectory();
    final file=File(p.join(dbFolder.path,'db1.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase{
  AppDatabase(NativeDatabase nativeDatabase):super(abrirConeccion());
  @override
  int get schemaVersion=>1;

  //Metodod listar
  Future<List<User>> getListsUsers() async{
    return await select(users).get();
  }

  //metodo insertar
  Future<int> insertUser(UsersCompanion usersCompanion) async{
    return await into(users).insert(usersCompanion);
  }

}










