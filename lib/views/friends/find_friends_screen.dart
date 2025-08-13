import 'package:flutter/material.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
 final people = [
    {
      'name': 'Darron Kulikowski',
      'avatarColor': const Color.fromARGB(255, 233, 188, 121),
      'imageUrl': 'https://randomuser.me/api/portraits/men/32.jpg',
    },
    {
      'name': 'Maryland Winkles',
      'avatarColor': const Color.fromARGB(255, 146, 235, 149),
      'imageUrl': 'https://randomuser.me/api/portraits/women/45.jpg',
    },
    {
      'name': 'Lauralee Quintero',
      'avatarColor': const Color.fromARGB(255, 235, 137, 170),
      'imageUrl': 'https://randomuser.me/api/portraits/women/68.jpg',
    },
    {
      'name': 'Alfonzo Schuessler',
      'avatarColor': const Color.fromARGB(255, 75, 38, 22),
      'imageUrl': 'https://randomuser.me/api/portraits/men/85.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Find Friends',style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: false,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   // onPressed: () {},
        //   Get.ba
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                hintText: 'Search email, name, or phone number',
                contentPadding: const EdgeInsets.only(
                    left: 10.0, bottom: 8.0, top: 8.0, right: 8),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.7),
                ),
              )),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildOptionTile(
                      icon: Icons.plagiarism,
                      iconColor: Colors.blue,
                      title: "Search Contact",
                      subtitle: "Find friends by phone number",
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.grey[100], 
                      thickness: 1,
                      indent: 20,         
                      endIndent: 20,      
                    ),

                    _buildOptionTile(
                      icon: Icons.facebook_rounded,
                      iconColor: Colors.blue[800]!,
                      title: "Connect to Facebook",
                      subtitle: "Find contacts via Facebook",
                      onTap: () {},
                    ),
                     Divider(
                      color: Colors.grey[100], 
                      thickness: 1,
                      indent: 20,         
                      endIndent: 20,      
                    ),
                    _buildOptionTile(
                      icon: Icons.group_add,
                      iconColor: Colors.brown,
                      title: "Invite Friends",
                      subtitle: "Invite friends to play together",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("People you many know"),
              Column(
                children: people.map((person) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                       CircleAvatar(
                          backgroundColor: person['avatarColor'] as Color,
                          radius: 22,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipOval(
                              child: Image.network(
                                person['imageUrl'] as String,
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person, size: 24);
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            person['name'] as String,
                            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                        
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(icon, color: iconColor,size: 50,),
      ),
      
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(title,style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(subtitle),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }

   Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Row(
          children: [
            Text(
              "View all",
              style: TextStyle(
                  color: Color(0xFFFFA63D),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.east_outlined, color: Color(0xFFFFA63D)),
            )
          ],
        ),
      ],
    );
  }
}
