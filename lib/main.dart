import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 13',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("মডিউল ১৩ এসাইনমেন্ট"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: const [
            CourseCard(
              title: "Full Stack Web Development with JavaScript (MERN)",
              batch: "ব্যাচ ১৯",
              hours: "৫৪ ঘন্টা ক্লাস",
              days: "৩০ দিন বাকি",
              imagePath: "assets/images/mern.png",
            ),
            CourseCard(
              title: "Full Stack Web Development with Python, Django & React",
              batch: "ব্যাচ ৩৬",
              hours: "৬৮ ঘন্টা ক্লাস",
              days: "৪০ দিন বাকি",
              imagePath: "assets/images/python.png",
            ),
            CourseCard(
              title: "Full Stack Web Development with ASP.Net Core",
              batch: "ব্যাচ ২০",
              hours: "৫৫ ঘন্টা ক্লাস",
              days: "৩৫ দিন বাকি",
              imagePath: "assets/images/asp.png",
            ),
            CourseCard(
              title: "SQA: Manual & Automated Testing",
              batch: "ব্যাচ ১৩",
              hours: "৬৫ ঘন্টা ক্লাস",
              days: "৪৫ দিন বাকি",
              imagePath: "assets/images/sqa.png",
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String batch;
  final String hours;
  final String days;
  final String imagePath;

  const CourseCard({
    super.key,
    required this.title,
    required this.batch,
    required this.hours,
    required this.days,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(batch, style: const TextStyle(fontSize: 12)),
                    Text(hours, style: const TextStyle(fontSize: 12)),
                    Text(days, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("বিস্তারিত দেখুন"),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
