import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Grid',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> courses = const [
    {
      "title": "Full Stack Web Development with Javascript (MERN)",
      "image": "assets/images/mern.png",
      "batch": "ব্যাচ ১১",
      "seatsLeft": "২ সিট বাকি",
      "daysLeft": "৫ দিন বাকি",
    },
    {
      "title": "Full Stack Web Development with Python, Django & React",
      "image": "assets/images/python.png",
      "batch": "ব্যাচ ১৩",
      "seatsLeft": "৮ সিট বাকি",
      "daysLeft": "১০ দিন বাকি",
    },
    {
      "title": "Web Development with ASP.Net Core",
      "image": "assets/images/asp.png",
      "batch": "ব্যাচ ৭",
      "seatsLeft": "২১ সিট বাকি",
      "daysLeft": "১০ দিন বাকি",
    },
    {
      "title": "SQA: Manual & Automated Testing",
      "image": "assets/images/sqa.png",
      "batch": "ব্যাচ ২৩",
      "seatsLeft": "১৬ সিট বাকি",
      "daysLeft": "২০ দিন বাকি",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("মডিউল এসাইনমেন্ট"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "মডিউল ১৩ এর এসাইনমেন্ট",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseCard(
                    title: course["title"]!,
                    image: course["image"]!,
                    seatLeft: course["seatsLeft"]!,
                    daysLeft: course["daysLeft"]!,
                    batch: course["batch"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title, image, batch, seatLeft, daysLeft;

  const CourseCard({
    super.key,
    required this.title,
    required this.image,
    required this.batch,
    required this.seatLeft,
    required this.daysLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Image not found')),
            ),
          ),
          const SizedBox(height: 8),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  _InfoTag(
                    child: Text(
                      batch,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  _InfoTag(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.event_seat,
                          size: 11,
                          color: Colors.black87,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          seatLeft,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  _InfoTag(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.history,
                          size: 11,
                          color: Colors.black87,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          daysLeft,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.grey.shade300,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "বিস্তারিত দেখি",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_right_alt,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTag extends StatelessWidget {
  final Widget child;

  const _InfoTag({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: child,
        ),
      ),
    );
  }
}
