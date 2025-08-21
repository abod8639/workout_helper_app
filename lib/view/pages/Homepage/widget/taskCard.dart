import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCard extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final String? duration;
  final void Function()? onTap;

  const TaskCard({
    Key? key,
    this.title,
    this.imageUrl,
    this.duration = '15 minutes',
    this.onTap,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> with SingleTickerProviderStateMixin {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) {
          setState(() => isPressed = false);
          widget.onTap?.call();
          Get.showSnackbar(
            GetSnackBar(
              title: "Send",
              message: "Task sent successfully!",
              duration: const Duration(seconds: 1),
            ),
          );
        },
        onTapCancel: () => setState(() => isPressed = false),
        child: AnimatedScale(
          scale: isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: Container(
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.imageUrl ??
                    "https://i.pinimg.com/1200x/d9/11/12/d911121ad1e2592a6031e89c730f086c.jpg",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: Colors.white70,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Training ${widget.duration}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )),
  );
}
}