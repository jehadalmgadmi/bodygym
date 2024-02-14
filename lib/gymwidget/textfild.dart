
import 'package:bodygym/DataBase.dart';
import 'package:bodygym/gymwidget/list_class.dart';
import 'package:bodygym/provider/exrsise.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class tiptextfild extends StatefulWidget {
  const tiptextfild({super.key});
  

  @override
  State<tiptextfild> createState() => _tiptextfildState();
}

 SqlDb sql1=SqlDb();
 TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  String text_titel=titleController.text;
   String contant_titel=contentController.text;
   bool reading=false;
   
   tip_item myTipItem = tip_item(
  titl: '${text_titel}',
  contant: '${contant_titel}',
  read_state: false, // 
);

class _tiptextfildState extends State<tiptextfild> {
  @override

  Widget build(BuildContext context) {
    final exe =Provider.of<Exrsise>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Add tip'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                   keyboardType: TextInputType.text,
                   controller: titleController,
                   maxLength: 20,
                  decoration: InputDecoration(
                    
                     //border for text fild
                    border: OutlineInputBorder(),
                   hintText: 'العنوان ',
                    hintStyle: TextStyle
                    (fontSize: 20),
                 
                   
                      
              
                    hintMaxLines: 20,
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  textInputAction: TextInputAction.next,
                     controller:contentController,
                   maxLength: 300,
                  decoration: InputDecoration(
                      //border for text fild
                    border: OutlineInputBorder(),
                    hintText: 'المحتوى',
                    helperStyle: TextStyle
                    (fontSize: 20),
                 
                    hintMaxLines: 20
                    
                  ),
                  keyboardType: TextInputType.text,
                ),
  
                SizedBox(height: 10),
                SizedBox(height: 15),
     ElevatedButton(
  onPressed: () async {
    List<Map<String, dynamic>> result = await sql1.readData('''
      SELECT * FROM "tips" WHERE main_titel='$text_titel'
    ''');

    // تحقق مما إذا كانت النتيجة فارغة أم لا
    if (result.isEmpty) {
      try {
        int response = await sql1.insertData('''
          INSERT INTO "tips" (main_titel,contant,read_state)
          VALUES (
            '$text_titel',
            '$contant_titel',
            "0"
          )
        ''');

        // تحقق مما إذا تمت العملية بنجاح
        if (response != null && response > 0) {
          // قم بتحديث القائمة المرتبطة بعرض البيانات
          setState(() {
            exe.addtip(myTipItem);
   
          });
        } else {
          // تنفيذ إجراءات في حالة فشل الإدراج
        }
      } catch (e) {
        // تنفيذ إجراءات في حالة حدوث أي خطأ
        print('Error: $e');
      }
    } else {
      // تنفيذ إجراءات في حالة تكرار القيمة الرئيسية أو وجود نتيجة موجودة بالفعل
    }
  },
  child: Text('Add'),
),
              ],
            )));
  }
  }
