import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerContainer extends StatefulWidget {
  const DrawerContainer({
    super.key,
  });

  @override
  State<DrawerContainer> createState() => _DrawerContainerState();
}

class _DrawerContainerState extends State<DrawerContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:80.0,left: 16,right: 16),
      child: Container(
        child: Column(children: [
          Container(
            // color: Colors.red,
            child: Column(children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,

              ),
              SizedBox(height: 20,),
              Text('Abhinav Vats',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily:'LexendDeca'),),

            ],)

          ),
          SizedBox(height: 50,),
          ListTile(
            leading: Icon(Icons.bookmark_added),
            title: Text('Saved Articles',style: TextStyle(fontFamily:'LexendDeca',fontWeight: FontWeight.bold),),
          ),ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text('Log Out',style: TextStyle(fontFamily:'LexendDeca',fontWeight: FontWeight.bold),),
          ),
        ],),
      ),
    );
  }
}
