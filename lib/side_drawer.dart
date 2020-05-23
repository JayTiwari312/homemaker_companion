import 'package:flutter/material.dart';
import 'package:homemakercompanion/home_screen.dart';
import 'package:homemakercompanion/landing1.dart';
import 'main.dart';
import 'landing1.dart';

class SideDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,//20.0,
      child: Drawer(
          child: new ListView(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.all(20),
                color: Colors.blue[800],
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('images/user.png'),
                          fit: BoxFit.fill),
                        ),
                      ),
                      Text("Usename", style: TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      ),
                      ),
                      Text("Email", style: TextStyle(
                          color: Colors.white
                      ),),
                    ],
                  ),
                ),
              ),
            ListTile(

              leading: Icon(Icons.person),
              title: Text('Profile', style: TextStyle(
                fontSize: 20
              ),),
              onTap: (){},
            ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('About Us', style: TextStyle(
                    fontSize: 20
                ),),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthTwoPage()),
                  );
                },
              ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text('Logout', style: TextStyle(
                    fontSize: 20
                ),),
                onTap: (){
//                  _auth.signOut();
//                  Navigator.pop(context);
                },
              )
            ],
          )),
    );
  }
}

Divider _buildDivider() {
  return Divider(
    color: Colors.grey.shade600,
  );
}
