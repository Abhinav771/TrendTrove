import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/saved_news.dart';

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
                backgroundImage: AssetImage('images/avatar/img_avatar.webp'),
              ),
              SizedBox(height: 20,),
              Text('Abhinav Vats',style: Theme.of(context).textTheme.titleLarge),

            ],)

          ),
          SizedBox(height: 50,),
          ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedNews(),
                ),
              );
            },
            leading: Icon(Icons.bookmark_added,color: Theme.of(context).secondaryHeaderColor,),
            title: Text('Saved Articles',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).secondaryHeaderColor),),
          ),ListTile(
            leading: Icon(Icons.login_outlined,color: Theme.of(context).secondaryHeaderColor,),
            title: Text('Log Out',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).secondaryHeaderColor),),
          ),
        ],),
      ),
    );
  }
}
