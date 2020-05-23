
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'assets.dart';
import 'inlanding.dart';

class SettingsTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/settings/settings2.dart";
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blue[800],
      ),
      backgroundColor: Colors.white,
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
          ),
                  child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/Vatsal.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.white,width: 2.0,),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Vatsal Gupta", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black
                          ),),
                          Text("India",style: TextStyle(
                            color: Colors.black,
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20.0),
                ListTile(
                  title: Text("Languages",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                  subtitle: Text("English US",style: TextStyle(color: Colors.grey[600]),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                  onTap: (){},
                ),
                ListTile(
                  title: Text("Profile Settings",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 17),),
                  subtitle: Text("Vatsal",style: TextStyle(color: Colors.grey[600]),),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                  onTap: (){},
                ),
                SwitchListTile(
                  title: Text("Email Notifications",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 17),),
                  subtitle: Text("On",style: TextStyle(color: Colors.grey[600]),),
                  value: true,
                  onChanged: (val){},
                ),
                SwitchListTile(
                  title: Text("Push Notifications",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 17),),
                  subtitle: Text("Off",style: TextStyle(color: Colors.grey[600]),),
                  value: false,
                  onChanged: (val){},
                ),
                ListTile(
                  title: Text("Logout",style: whiteBoldText,),
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
