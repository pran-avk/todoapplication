import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';

class TodoContainer extends StatelessWidget {
  final int id;
  final String title;
  final String desc;
  final bool isDone;
  final Function onPress;

  const TodoContainer({super.key,required this.id, required this.title, required this.desc, required this.isDone,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: Text(title,style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
            ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: IconButton(onPressed: (){
                  onPress(id);
                }, icon: Icon(Icons.delete_rounded,color: Colors.white,size: 32,))
                ),

            ]
          ),
          SizedBox(height: 6,),
          Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(desc,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)))
        ],
      ),
    ),);
  }
}
