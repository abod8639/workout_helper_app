import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/buildNavigationButton.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskInput.dart';
import '../heart_rate_stats_page.dart';
import '../calorie_tracker_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     // colors: [Colors.green[800]!, Colors.green[600]!],
        //   ),
        // ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Workout Helper',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              taskInput(),
              const SizedBox(height: 20),
              SizedBox(
                height: 170,
                child: ListView(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    taskCard(title:  "push-ups" ,
                    imageUrl: "https://i.pinimg.com/1200x/7d/ab/36/7dab366ba4ec4013637117176b94ebed.jpg",
                    onTap: (){}
                    ),
                    taskCard(title:  "squats"   ,
                    imageUrl: "https://i.pinimg.com/736x/ea/fb/f0/eafbf0d366919fe111f07a6953850ef4.jpg"
                    ),
                    taskCard(title:  "lunges"   ,
                    imageUrl: "https://i.pinimg.com/736x/ea/fb/f0/eafbf0d366919fe111f07a6953850ef4.jpg"
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              buildNavigationButton(
                context,
                'Heart Rate Stats',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeartRateStatsPage(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildNavigationButton(
                context,
                'Calorie Tracker',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalorieTrackerPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget taskCard({
   final String? title,
   final String? imageUrl,
   void Function()? onTap,
   }) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: InkWell(
      splashColor: Colors.white.withAlpha(50),
      onTap: onTap ,
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
                  color: Colors.white.withAlpha(150),
                  fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('training 15 minutes', style: TextStyle(color: Colors.white.withAlpha(150))),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    ),
  );
}
