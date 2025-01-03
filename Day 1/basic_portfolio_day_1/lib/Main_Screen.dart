import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Portfolio',
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjH3asamCIge-3u65qhVVMg5OpC-_xrSV_9LDQcn8Mc5ZGKVmDDDZwNl9Gx2mpSj_oKmx9vZMyxVMe0dTTT1TIpAylkUsJ_p0feDwHuOipsnZx-lSPqqShmhVKiaTSRe4GSKMwijOwyJtVyndpb8LQnITkzbtoNmSUqSzOAvXf6OmG3yRw/s220/profile.jpeg',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Zaid Sayyed',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Zaidsayyed.dev@gmail.com',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Education',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Divider(
              color: Colors.white38,
            ),
            const SizedBox(height: 10),
            const Text(
              'United University',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Text(
              'Bachelor of Computer Application (2022-2025)',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Burhani College',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Text(
              'Intermediate in Commerce Maharashtra HSC (2020-2022)',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'St. Agrasen High School',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Text(
              'High School Maharashtra SSC (2019-2020)',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Projects',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Divider(
              color: Colors.white38,
            ),
            const Text(
              'Codify',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              'Tech Stack: Flutter, MERN, Blockchain, Generative AI',
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '\u2022 Developed an all-in-one platform for students and professionals to bridge the gap between college and career.',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Stay Sync',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              'Tech Stack: Flutter, Firebase, Figma',
              style: TextStyle(color: Colors.redAccent, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '\u2022 Implemented features for room allocation, maintenance requests, and announcements, reducing administrative workload.',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Achievements',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Divider(
              color: Colors.white38,
            ),
            Text(
              '• First Place, in the Hackathon Uhack2.0 : Defeated IIIT and NIT students to win 20,000 INR.',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '• Lead Organiser, for a Fully Sponsored District-Level Hackathon: Successfully secured 6 sponsors and managed the event with over 250 participants.',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '• Top 100 in Google Developers Solution Challenge: Ranked in Google’s Indian Region Boot-camp, Delhi.',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '• CODE FIESTA :Achieved Runner-up position among 350 participants in competitive programming',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
