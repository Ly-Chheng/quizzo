import 'package:flutter/material.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Friends"),
      ),
      body: Column(
        children: [
         TextFormField(
                    // controller: loginNameController,
                    decoration: InputDecoration(
                      hintText: "",
                        // hintStyle: FontsHelper.smallLight,
                      prefixIcon:const Icon(Icons.search,color: Colors.grey,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:const BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(color: Colors.grey)
                      )

                    ),
                  ),
        ],
      ),
    );
  }
}
