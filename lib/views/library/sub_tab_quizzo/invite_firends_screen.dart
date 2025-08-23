import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/section_reusable.dart';

class InviteFirendsScreen extends StatefulWidget {
  const InviteFirendsScreen({super.key});

  @override
  State<InviteFirendsScreen> createState() => _InviteFirendsScreenState();
}

class _InviteFirendsScreenState extends State<InviteFirendsScreen> {

  final theme = AppTheme();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showCloseIcon = false;
  bool _isFocused = false;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _showCloseIcon = _searchController.text.isNotEmpty;
      });
    });

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    _focusNode.unfocus();
  }

 
 
  @override
  Widget build(BuildContext context) {
    Color borderColor = _isFocused
        ? const Color(0xFFFFA63D)
        : (Get.context!.isDarkMode ? const Color(0xff272B36) : Colors.white);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.iconTheme,
        ),
        title: Text("Invite friends to play",style: Style.subHeaderTextStyleGray22_24(context,color: Colors.black),)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            TextFormField(
            controller: _searchController,
            focusNode: _focusNode,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/icons/search.png',
                  width: 10,
                  height: 10,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: _showCloseIcon
                  ? GestureDetector(
                      onTap: _clearSearch,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(Icons.close, color: Colors.black, size: 20),
                      ),
                    )
                  : null,
              filled: true,
              fillColor: theme.fillColor,
              hintText: 'Search frinds name, username, or email',
              hintStyle: TextStyle(
                 fontFamily: AppFontStyle().fontRegular,
                fontSize: AppFontSize(context).descriptionLargeSize,
                color: Colors.grey,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.0),
                borderRadius: BorderRadius.circular(10.7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

                
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text("Friend Selected ",style: Style.subHeaderTextStyleGray22_24(context),),
                    SizedBox(width: 10,),
                    Text("(16)",style: Style.subHeaderTextStyleGray22_24(context,color: Color(0xFFFFA63D)),)
                  ],
                ),
              ),
              buildProfileDelete(), 
          ],
        ),
      ),
    );
  }


  Widget buildProfileDelete (){
    return Stack(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(child: ClipOval(child: Image.network('https://img.freepik.com/premium-photo/3d-cartoon-avatar-man-minimal-3d-character-avatar-profile_652053-2068.jpg?w=360',height: 100,))),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Icon(
          Icons.close
        ))
      ],
      
    );
  }
}
