import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/model/ExerciseModel.dart';
import 'package:workout_helper_app/view/widgets/edit_exercise_dialog.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';

class TaskCard extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final String? duration;
  final void Function()? onTap;
  final ExerciseModel? exercise; // Add this field

  const TaskCard({
    super.key,
    this.title,
    this.imageUrl,
    this.duration = '15 minutes',
    this.onTap,
    this.exercise,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard>
    with SingleTickerProviderStateMixin {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onLongPress: () {
            editTaskCard();
          },
          onTapDown: (_) => setState(() => isPressed = true),
          onTapUp: (_) {
            setState(() => isPressed = false);
            widget.onTap?.call();
            // Get.showSnackbar(
            //   GetSnackBar(
            //     title: "Send",
            //     message: "Task sent successfully!",
            //     duration: const Duration(seconds: 1),
            //   ),
            // );
          },
          onTapCancel: () => setState(() => isPressed = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            transform: Matrix4.identity()
              ..scale(isPressed ? 0.98 : 1.0)
              ..translate(0.0, isPressed ? 2.0 : 0.0),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.imageUrl! 
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
        ),
      ),
    );
  }
    
  void editTaskCard() {
    if (widget.exercise == null) {
      Get.snackbar(
        'Error',
        'Cannot edit: Exercise details not found',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        duration: const Duration(seconds: 2),
      );
      return;
    }

    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Exercise'),
                onTap: () {
                  Get.back();
                  Get.dialog(
                    EditExerciseDialog(exercise: widget.exercise!),
                    barrierDismissible: true,
                  ).then((_) {
                    setState(() {});
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text(
                  'Delete Exercise',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Get.back();
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Delete Exercise'),
                      content: Text(
                        'Are you sure you want to delete "${widget.exercise!.title}"?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            try {
                              final controller = Get.find<ExerciseController>();
                              controller.deleteExercise(widget.exercise!);
                              Get.back();
                              Get.snackbar(
                                'Success',
                                'Exercise deleted successfully',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green.withOpacity(0.1),
                                duration: const Duration(seconds: 2),
                              );
                            } catch (e) {
                              Get.snackbar(
                                'Error',
                                'Failed to delete exercise: $e',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red.withOpacity(0.1),
                              );
                            }
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
  }

