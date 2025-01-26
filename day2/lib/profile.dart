import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withAlpha(40),
              backgroundImage: AssetImage(
                'assets/images/profile.jpeg',
              ),
              radius: 25,
            ),
            Text(
              'Hey, Zaid 😊',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15,bottom: 5),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent.withAlpha(40),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Text(
                      '🙌 Long time no see! Your last checkup was 12 months ago.We recommend visiting your doctor.',
                      style: TextStyle(color: Colors.deepOrange, fontSize: 14),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 5,
                        children: [
                          Text(
                            'Plan a Checkup',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.deepOrange,
                            size: 18,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              _buildprofileListTile(CupertinoIcons.person, 'Personal Info'),
              _buildprofileListTile(
                  Icons.medical_information_outlined, 'Medical Card'),
              _buildprofileListTile(
                  Icons.local_hospital_outlined, 'Clinics & Labs'),
              _buildprofileListTile(CupertinoIcons.creditcard, 'Purchases'),
              _buildprofileListTile(Icons.settings, 'Settings'),
              _buildprofileListTile(Icons.support, 'Support'),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildprofileListTile(IconData icon, String text) => Column(
        children: [
          ListTile(
            leading: Text(
              String.fromCharCode(icon.codePoint),
              style: TextStyle(
                //  inherit: false,
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                fontFamily: icon.fontFamily,
                package: icon.fontPackage,
              ),
            ),
            title: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Divider(),
        ],
      );
}
