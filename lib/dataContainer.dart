import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dataContainer extends StatelessWidget {
  final double height;
  var leadingIcon;
  String titleText;
  String lineOneLeft;
  String lineOneRight;
  String lineTwoLeft;
  String lineTwoRight;
  String lineThreeLeft;
  String lineThreeRight;

  dataContainer(
      this.height,
      this.leadingIcon,
      this.titleText,
      this.lineOneLeft,
      this.lineOneRight,
      this.lineTwoLeft,
      this.lineTwoRight,
      this.lineThreeLeft,
      this.lineThreeRight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(0, 2), blurRadius: 20),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: leadingIcon,
            title: Text(
              "$titleText",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold),
            ),
            trailing: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(context: context, builder: (BuildContext context2){
                      return Container(
                        height: 250,
                        child: Center(child: Text("Edit Bottom Sheet"),),
                      );
                    });
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 10,
                  ),
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  "$lineOneLeft",
                  style: TextStyle(
                      fontSize: 10,color: Colors.blue[900], fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text("$lineOneRight",style: TextStyle(fontSize: 10),)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  "$lineTwoLeft",
                  style: TextStyle(
                      fontSize: 10,color: Colors.blue[900], fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text("$lineTwoRight",style: TextStyle(fontSize: 10),)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  "$lineThreeLeft",
                  style: TextStyle(
                      fontSize: 10,color: Colors.blue[900], fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text("$lineThreeRight",style: TextStyle(fontSize: 10),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
