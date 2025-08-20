import 'package:flutter/material.dart';

Widget taskCard({
  final String? title,
  final String? imageUrl,
  void Function()? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: InkWell(
      splashColor: Colors.white.withAlpha(200),
      onTap: onTap,
      
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl ?? "https://i.pinimg.com/1200x/d9/11/12/d911121ad1e2592a6031e89c730f086c.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Colors.black45,
              blurRadius: 10,
              // spreadRadius: 1,
              offset: const Offset(0, -5), // changes position of shadow
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
