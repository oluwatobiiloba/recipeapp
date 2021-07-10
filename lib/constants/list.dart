import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


buildRecipestitleVariations1(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Center(
      child: Text(
        text,style: GoogleFonts.roboto(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
      ),
    ),
  );
}

buildRecipesVariations2(String text,bool opacity){
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,style: GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color:opacity ? Colors.grey[400] : Colors.black,
    ),
    ),
  );
}

buildRecipesdescription(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,style: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color:Colors.grey[400],
    ),
    ),
  );
}

buildRecipesdescription2(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,style: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color:Colors.grey[400],
    ),
    ),
  );
}

buildRecipeTile(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.openSans(
      fontSize: 22,
      fontWeight: FontWeight.bold,

    ),
    ),
  );
}
buildRecipeTile2(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.openSans(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,

      ),
    ),
  );
}

buildRecipesubtile(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,style: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color:Colors.grey[400],
    ),
    ),
  );
}


buildRecipecalories(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,style: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color:Colors.black,
    ),
    ),
  );
}

buildRecipetime(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,style: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color:Colors.black,
    ),
    ),
  );
}

