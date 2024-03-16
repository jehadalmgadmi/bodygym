import 'package:bodygym/provider/exrsise.dart';
import 'package:bodygym/gymwidget/list_class.dart';
import 'package:flutter/cupertino.dart';


class db_function {
  selectdata(List l1) async {
    List<Map<String, dynamic>> response =
        await sql1.readData("SELECT * FROM exrsise");
// تحويل النتيجة إلى كائنات Item وإضافتها إلى قائمة itemsList
   

    response.forEach((row) {
      item newitem = item(
        main_image: row['main_image'],
        name: row['exsrsis_name'],
        count: row['count'],
        explane: row['explane'],
        image1: row['image1'],
        image2: row['image2'],
        explane_state: row['exsrsis_state'] == 1 ? true : false,
      );
      l1.add(newitem);
      counter_exrsise++;
    }
  
    );
    response.forEach((Row) {
      if(
      Row['exsrsis_state']==1 )
      {
        completed_exrsis++;
      }

     });
  }

//تتحقق من من الاسم موجود اولا تم تقوم بالحدف
  delet_exsrsis(String exs_name) async {
    int response = await sql1.deleteData('''
      DELETE FROM exrsise WHERE exsrsis_name = "$exs_name"
    ''');
    // ignore: unnecessary_null_comparison
    if (response != null) {
      plan_list.removeWhere((item) => item.name == exs_name);
    }
  }

  deleteAll_exrsis() async {
    // تنفيذ استعلام DELETE لحذف جميع الصفوف في الجدول
    int response = await sql1.deleteData('DELETE FROM exrsise');
    print('تم حذف $response صفوف');
    return response;
  }

/////////////////////select tip
  select_tip_data(List l1) async {
    List<Map<String, dynamic>> response =
        await sql1.readData("SELECT * FROM tips");
// تحويل النتيجة إلى كائنات Item وإضافتها إلى قائمة itemsList
    response.forEach((row) {
      tip_item newitem = tip_item(
        titl: row['main_titel'],
        contant: row['contant'],
        read_state: row['read_state'] == 1 ? true : false,
      );
      l1.add(newitem);
      tipcount++;
    });
     
      
       response.forEach((Row) {
      if(
      Row['read_state']==1 )
      {
        tipread++;
      }

     });
  }

///////////////////delet tip
  delet_tip(tip_item t) async {
    int response = await sql1.deleteData('''
      DELETE FROM tips WHERE main_titel = "${t.titl}"
    ''');
    // ignore: unnecessary_null_comparison
    if (response != null) {
      tip_list.removeWhere((tip_item) => tip_item.titl == t.titl);
    }
  }

  update_tip(tip_item t) async {
    List<Map<String, dynamic>> result = await sql1.readData('''
      SELECT * FROM "tips" WHERE main_titel='${t.titl}'
    ''');
    // تحقق مما إذا كانت النتيجة فارغة أم لا
    if (result.isNotEmpty) {
      // ignore: unused_local_variable
      int response = await sql1.updateData('''
        UPDATE "tips"
        SET  main_titel = '${t.titl}',contant = '${t.contant}', read_state = '0'
        WHERE main_titel = '${t.titl}';
      ''');
    }
  }

  deleteAll_tip() async {
    // تنفيذ استعلام DELETE لحذف جميع الصفوف في الجدول
    int response = await sql1.deleteData('DELETE FROM tips');
    print('تم حذف $response صفوف');
    return response;
  }

update_read(bool s,String n)
 async{
       
       // ignore: unused_local_variable
       int response = await sql1.updateData('''
        UPDATE "tips"
        SET  read_state = '${s?1:0}'
        WHERE main_titel = '${n}';
      ''');
}

update_plan_state(bool update_state,String update_name)
 async{
       
       // ignore: unused_local_variable
       int response = await sql1.updateData('''
        UPDATE "exrsise"
        SET  exsrsis_state = '${update_state?1:0}'
        WHERE exsrsis_name = '${update_name}';
      ''');
}

}



