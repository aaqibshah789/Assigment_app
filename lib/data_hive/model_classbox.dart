import 'package:assigment_app/data_hive/data/model_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseBox {
  static final databse_student = "databse_student";


  static Box<StudentData> GetStudentData() {
    return Hive.box(databse_student);
  }
  static GetHiveInitFunction() async{
    await Hive.initFlutter();
    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(StudentDataAdapter());

      if(Hive.isBoxOpen(databse_student)){
        await Hive.openBox<StudentData>(databse_student);
      }

    }
  }

    static String getNewKey(){
      return DateTime.now().millisecondsSinceEpoch.toString();
    }
}