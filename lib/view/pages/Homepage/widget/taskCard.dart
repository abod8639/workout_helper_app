import 'package:flutter/material.dart';

Widget taskCard({
  final String? title,
  final String? imageUrl,
  void Function()? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: InkWell(
      splashColor: Colors.white.withAlpha(50),
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Colors.white,
          image: DecorationImage(
            // image: NetworkImage("https://i.pinimg.com/1200x/d9/11/12/d911121ad1e2592a6031e89c730f086c.jpg"),
            // "https://i.pinimg.com/736x/ea/fb/f0/eafbf0d366919fe111f07a6953850ef4.jpg",
            image: NetworkImage(imageUrl!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
          // gradient: LinearGradient(
          //   colors: [Colors.greenAccent[400]!, Colors.greenAccent[100]!],
          //   end: Alignment.topCenter,
          //   begin: Alignment.bottomRight,
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 12,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black.withAlpha(150),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                  color: Colors.white.withAlpha(180),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'training 15 minutes',
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black.withAlpha(150),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                  color: Colors.white.withAlpha(150),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    ),
  );
}
