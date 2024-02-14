import 'package:bodygym/DataBase.dart';
import 'package:bodygym/func.dart';
import 'package:bodygym/gymwidget/list_class.dart';
import 'package:bodygym/provider/exrsise.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bodygym/gymwidget/textfild.dart';
import 'package:provider/provider.dart';

class HealthTip extends StatefulWidget {
  const HealthTip({Key? key}) : super(key: key);

  @override
  State<HealthTip> createState() => _HealthTipState();
}

db_function fun = db_function();
SqlDb sql1 = SqlDb();
TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  String text_titel=titleController.text;
   String contant_titel=contentController.text;
      bool reading=false;


class _HealthTipState extends State<HealthTip> {
  @override
  Widget build(BuildContext context) {
    final exe = Provider.of<Exrsise>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(231, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 231, 130, 6),
        title: Text(
          "Health Tips",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          )
        ],
    leading:IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30,
              icon: Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            )
      ),
      body: Column(
        children: [
          Container(
            height: 615,
            width: 500,
            child: ListView.builder(
              itemCount: tip_list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            TextEditingController _textEditingController =
                                TextEditingController();
                            return Scaffold(
                              backgroundColor:
                                  Color.fromARGB(173, 255, 255, 255),
                              body: Container(
                                decoration: BoxDecoration(
                                    //  تدريج الوان
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                      Color.fromARGB(196, 233, 236, 244),
                                      Color.fromRGBO(152, 156, 170, 0.707)
                                    ])),
                                width: double.infinity,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "${tip_list[index].contant}",
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 430,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        showBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Scaffold(
                                                 
                                                  body: Container(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          TextField(
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                titleController,
                                                            maxLength: 20,
                                                            decoration:
                                                                InputDecoration(
                                                              //border for text fild
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText:
                                                                  'Titel ',
                                                              hintStyle:
                                                                  TextStyle(
                                                                      fontSize:
                                                                          20),

                                                              hintMaxLines: 20,
                                                            ),
                                                          ),
                                                          SizedBox(height: 15),
                                                          TextField(
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            controller:
                                                                contentController,
                                                            maxLength: 300,
                                                            decoration:
                                                                InputDecoration(
                                                                    //border for text fild
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                    hintText:
                                                                        'Content',
                                                                    helperStyle:
                                                                        TextStyle(
                                                                            fontSize:
                                                                                20),
                                                                    hintMaxLines:
                                                                        20),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                          ),
                                                          SizedBox(height: 10),
                                                          SizedBox(height: 10),
                                                          ElevatedButton(
      onPressed: () {
  tip_item t1=tip_item(titl: text_titel, contant: contant_titel, read_state: reading) ; 
    
      setState(() {
          fun.update_tip(t1);
        exe.updatetip(t1, tip_list[index]);
      });

                                                           
                                                            },
                                                            child: Text('Edit'),
                                                          ),
                                                        ],
                                                      )));
                                            });
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromARGB(
                                                      255, 49, 111, 212))),
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.red)),
                                      onPressed: () {

                                       
                                       fun.delet_tip(tip_list[index]);
                                       setState(() {
                                        if( tip_list[index].read_state==true)
                      {
                         completed_exrsis--;
                      }
                      
                      tip_list[index].read_state=false;

                                       exe.removetip(tip_list[index]);
                                        });
                                         Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 30, 15, 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(173, 183, 159, 133),
                              Color.fromRGBO(189, 171, 119, 0.538)
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                          child: ListTile(
                            title: Text(
                              "${tip_list[index].titl}",
                              style: TextStyle(
                                color:tip_list[index].read_state? Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 83, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
  
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                        
                                      
                  tip_list[index].read_state = !tip_list[index].read_state;
                if(tip_list[index].read_state==true)
                {
         tipread++; 
      } else {
         tipread--; 
      }
             
                     
                              
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                size: 32,
                                color: tip_list[index].read_state
                                    ? Color.fromARGB(255, 255, 255, 255)
                                    : Color.fromARGB(255, 247, 29, 0),
                                    
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const tiptextfild()));
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 49, 111, 212))),
                child: Text(
                  "add",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  fun.deleteAll_tip();

                  setState(() {
                    exe.deletalltip();
                  });
                },
                child: Text(
                  "Delete all",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
