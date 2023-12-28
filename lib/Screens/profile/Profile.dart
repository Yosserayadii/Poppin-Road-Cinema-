import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:poppinroadcimema/Authentification/signin.dart';
import 'package:poppinroadcimema/Screens/ticket/qr_genreator.dart';
import 'package:poppinroadcimema/providers/UserProvider.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (userProvider.user == null) Padding(
                    padding: EdgeInsets.all(50),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "You must be connected to access the profile .",
                      ),
                    ),
                  ) else Column(
                    children: [
                      Container(
                        height: 30,
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromARGB(255, 143, 15, 23),
                            width: 2.0,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(userProvider.user!.photoURL!),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      Text(
                        userProvider.user!.displayName!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ListTile(
                            title: Text("Email:"),
                            subtitle: Text(userProvider.user!.email ?? "N/A"),
                          ),
                          ListTile(
                            title: Text("Phone:"),
                            subtitle: Text(
                                userProvider.user!.phoneNumber ?? "+216 56 218 004"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 23),
                        child: Text(
                          '​Historique',
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 27,
                        height: 6,
                        decoration: ShapeDecoration(
                          color: CustomColors.fifthColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          mainAxisExtent: 200,
                        ),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              FileDownloader.downloadFile(
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/test-54e68.appspot.com/o/tickets%2FDocument1.pdf?alt=media&token=e91adb29-1cf1-41fe-85f0-edbff65c473f',
                                onDownloadCompleted: (String path) {},
                              );
                            },
                            child: Container(
                              // Set the desired height for each grid item
                              child: Column(
                                children: [
                                  QrGeretor(),
                                  ElevatedButton(
                                    onPressed: () {
                                      FileDownloader.downloadFile(
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/test-54e68.appspot.com/o/tickets%2FDocument1.pdf?alt=media&token=e91adb29-1cf1-41fe-85f0-edbff65c473f',
                                        onDownloadCompleted: (String path) {},
                                      );
                                    },
                                    child: Icon(Icons.download),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
