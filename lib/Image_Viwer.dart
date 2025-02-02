import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;

  FullScreenImageViewer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'ภาพประกอบ',
            style: TextStyle(
                fontSize: height * 0.026, fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(),
        ),
      ),
      body: PhotoView(
        imageProvider: AssetImage(imagePath),
        backgroundDecoration: BoxDecoration(
          color: Colors.transparent, // พื้นหลังสีดำเพื่อให้ดูชัดเจน
        ),
      ),
    );
  }
}
