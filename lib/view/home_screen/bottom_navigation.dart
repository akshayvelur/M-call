

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_call/view/contact/contact_page.dart';
import 'package:m_call/view/favorite/favorite.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ContactPage(),
   Favoritepage()
   
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(selectedLabelStyle: GoogleFonts.roboto(fontSize: 13),unselectedLabelStyle:  GoogleFonts.roboto(fontSize: 13),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      //  selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/contacts.png"),size: 30,),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/bookmarks.png"),size: 30,),
            label: 'Favorite',
          ),
         
        ],
      ),
    );
  }}