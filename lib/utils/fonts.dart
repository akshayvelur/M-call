import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


 
   flextext(final color,{double size=20,int Fweight=400}){
          return GoogleFonts.ubuntu(
      color:color,fontSize: size,fontWeight:FontWeight.values[(Fweight~/100)-1]);
        } 
        
 
   appLogo(final color,{double size=20,int Fweight=400}){
          return GoogleFonts.pacifico(
      color:color,fontSize: size,fontWeight:FontWeight.values[(Fweight~/100)-1]);
        } 
        
   message(final color,{double size=20,int Fweight=400}){
          return GoogleFonts.pacifico(
      color:color,fontSize: size,fontWeight:FontWeight.values[(Fweight~/100)-1]);
        } 