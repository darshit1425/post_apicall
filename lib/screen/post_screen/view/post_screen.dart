import 'package:flutter/material.dart';
import 'package:post_apicall/screen/post_screen/provider/post_provider.dart';
import 'package:provider/provider.dart';

class Post_Screen extends StatefulWidget {
  const Post_Screen({Key? key}) : super(key: key);

  @override
  State<Post_Screen> createState() => _Post_ScreenState();
}

class _Post_ScreenState extends State<Post_Screen> {
  Post_Provider? ProviderT;
  Post_Provider? ProviderF;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtjob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProviderT = Provider.of<Post_Provider>(context, listen: true);
    ProviderF = Provider.of<Post_Provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtname,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  // prefixIcon: Icon(
                  //   Icons.account_box_outlined,
                  //   color: Colors.blueAccent,
                  // ),
                  label: Text(
                    "Name",
                    style: TextStyle(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtjob,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  // prefixIcon: Icon(
                  //   Icons.ac_unit_outlined,
                  //   color: Colors.blueAccent,
                  // ),
                  label: Text(
                    "Job",
                    style: TextStyle(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                String name = txtname.text;
                String job = txtjob.text;

                String msg = await ProviderF!.post(name, job);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$msg")),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.black,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
