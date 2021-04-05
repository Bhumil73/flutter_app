import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/dataContainer.dart';

class profile extends StatefulWidget {
  @override
  _profile createState() => _profile();
}

class _profile extends State<profile> {
  String _targetIndustry = 'Software Engineering';
  double _progressValue = 0.65;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double topContainerSize = size.height * 0.2;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Profile"),
        leading: Icon(Icons.arrow_back_rounded),
        actions: [
          TextButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (BuildContext context2){
              return Container(
                height: 250,
                child: Center(
                  child: Text("Can't let you leave"),
                ),
              );
            });
          }, child: Row(
            children: [
              Text("Sign Out",style: TextStyle(color: Colors.white),),
              Icon(Icons.add_to_home_screen_rounded,color: Colors.white,),
            ],
          )),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: topContainerSize,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        minRadius: 20,
                        maxRadius: 50,
                        child: Icon(
                          Icons.person_outline,
                          size: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: ListTile(
                        title: Text(
                          "Arnav Sharma",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              "Target Industry : ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: DropdownButton<String>(
                                value: _targetIndustry,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 15,
                                elevation: 16,
                                dropdownColor: Colors.blue,
                                iconDisabledColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                onChanged: (String newValue) {
                                  _targetIndustry = newValue;
                                  setState(() {});
                                },
                                items: <String>[
                                  'Software Engineering',
                                  'Data Scientist',
                                  'UI Designer',
                                  'System Analyst'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: LinearProgressIndicator(
                          value: _progressValue,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${(_progressValue * 100).floor()}% Profile Completed",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Bottom Elements
          Container(
            height: size.height * 0.63,
            child: ListView(
              shrinkWrap: true,
              semanticChildCount: 3,
              children: [
                dataContainer(
                    size.height * 0.17,
                    Icon(
                      Icons.school_rounded,
                      color: Colors.transparent,
                    ),
                    "Personal",
                    "Date of Birth : ",
                    "07 October 2000",
                    "Email : ",
                    "samridhhodas.das8@gmail.com",
                    "Location : ",
                    "Kolkata, West Bengal"),
                dataContainer(
                    size.height * 0.17,
                    Icon(Icons.school_rounded),
                    "Education",
                    "B-Tech Software Engineering : ",
                    "SRM Institute of Science and Technology <Board>",
                    "Standard : ",
                    "Second Year",
                    "Location : ",
                    "Chennai"),
                dataContainer(
                    size.height * 0.17,
                    Icon(
                      Icons.school_rounded,
                      color: Colors.transparent,
                    ),
                    "Experience",
                    "B-Tech Software Engineering : ",
                    "SRM Institute of Science and Technology (2019-2023)",
                    "B-Tech Software Engineering : ",
                    "SRM Institute of Science and Technology (2019-2023)",
                    "",
                    ""),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showModalBottomSheet(context: context, builder: (BuildContext context2){
            return Container(
              height: 250,
              child: Center(child: Text("Edit Bottom Sheet"),),
            );
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            "EDIT SUGGESTED TARGETS",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
