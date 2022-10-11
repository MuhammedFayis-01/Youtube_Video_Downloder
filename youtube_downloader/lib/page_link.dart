import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_downloader/download.dart';

class PageLinkScreen extends StatelessWidget {
  final urlController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 6, color: Colors.black26, offset: Offset(0, 2))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              controller: urlController,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  hintText: "Paste your URL",
                  hintStyle: GoogleFonts.poppins(),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 14)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 150,
            height: 45,
            child: ElevatedButton(
              onPressed: () async {
                await Download().downloadVideo(urlController.text,"Youtube Downloader");
              },
              child: Text(
                "Download video",
                style: GoogleFonts.poppins(
                    color: Color(0xffcd1d25), fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
          )
        ],
      ));
  }
}