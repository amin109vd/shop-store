
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/Setting_AllPage/currectpassword.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/home_screen.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Color(0xff00ADB5),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
          child: ListView(
            children: [
              Text(
                'setting',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xff00ADB5),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildAccountOptionRow(title: "Changepassword",onpressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CurrectPassword(),));
              }),
              buildAccountOptionRow(title: "Content setting",onpressed: (){},),
              buildAccountOptionRow(title: "Social",onpressed: (){}),
              buildAccountOptionRow(title: "Language",onpressed: (){}),
              buildAccountOptionRow(title: "Privecy and security",onpressed: (){}),
              SizedBox(height: 40),
              Row(
                children: [
                  Icon(
                    Icons.volume_up_outlined,
                    color: Color(0xff00ADB5),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Notification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildNotificationOptionRow("New for you", true),
              buildNotificationOptionRow("Account activity", true),
              buildNotificationOptionRow("Opportunity", false),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'SIGN OUT',
                        style: TextStyle(letterSpacing: 2.2, fontSize: 16),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Row buildNotificationOptionRow(String title, bool isactive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(value: isactive, onChanged: (bool val) {}))
      ],
    );
  }
}
class buildAccountOptionRow extends StatefulWidget {
  const buildAccountOptionRow({Key? key, required this.title,required this.onpressed}) : super(key: key);
  final String title;
  final onpressed;
  @override
  State<buildAccountOptionRow> createState() => _buildAccountOptionRowState();
}

class _buildAccountOptionRowState extends State<buildAccountOptionRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[600]),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );;
  }
}