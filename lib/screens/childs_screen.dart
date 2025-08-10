// File: childs_screen.dart

import 'package:flutter/material.dart';
import 'child_overview_screen.dart'; // <-- 1. Import halaman baru

class ChildsScreen extends StatelessWidget {
  const ChildsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('My Children'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showAddChildDialog(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildChildCard(
            context, // <-- 2. Kirim BuildContext
            name: 'Kiara Azka',
            age: '8 years old',
            grade: 'Grade 3',
            avatar: 'E',
            color: Colors.pink,
            activities: [
              'Watching YouTube',
              'Using Instagram',
              'Playing Games',
            ],
            screenTime: '2h 45m today',
            alertLevel: 'Safe',
          ),
          const SizedBox(height: 16),
          _buildChildCard(
            context, // <-- 2. Kirim BuildContext
            name: 'Hamiz Ghani',
            age: '10 years old',
            grade: 'Grade 5',
            avatar: 'A',
            color: Colors.blue,
            activities: ['Browse Web', 'Discord Chat', 'Watching TikTok'],
            screenTime: '4h 12m today',
            alertLevel: 'Monitor',
          ),
          const SizedBox(height: 16),
          _buildChildCard(
            context, // <-- 2. Kirim BuildContext
            name: 'Chelsea Livy',
            age: '6 years old',
            grade: 'Grade 1',
            avatar: 'S',
            color: Colors.green,
            activities: ['Educational Apps', 'Video Calls', 'Drawing App'],
            screenTime: '1h 30m today',
            alertLevel: 'Safe',
          ),
          const SizedBox(height: 24),

          // Add Child Button (Tidak ada perubahan di sini)
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => _showAddChildDialog(context),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 40,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Add New Child',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildCard(
    BuildContext context, { // <-- 3. Terima BuildContext
    required String name,
    required String age,
    required String grade,
    required String avatar,
    required Color color,
    required List<String> activities,
    required String screenTime,
    required String alertLevel,
  }) {
    Color alertColor = alertLevel == 'Safe'
        ? Colors.green
        : alertLevel == 'Monitor'
        ? Colors.orange
        : Colors.red;

    // 4. Bungkus Container dengan InkWell untuk membuatnya dapat diklik
    return InkWell(
      onTap: () {
        // 5. Aksi saat di-tap: Pindah ke halaman overview
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChildOverviewScreen(
              // Kirim data anak ke halaman overview
              name: name,
              age: age,
              grade: grade,
              avatar: avatar,
              color: color,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16), // Samakan radius dengan Container
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: color,
                  child: Text(
                    avatar,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$age • $grade',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            screenTime,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: alertColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              alertLevel,
                              style: TextStyle(
                                fontSize: 10,
                                color: alertColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'edit', child: Text('Edit Profile')),
                    // ... menu lainnya
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Recent Digital Activities',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: activities
                  .map(
                    (activity) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_getActivityIcon(activity), size: 14, color: color),
                          const SizedBox(width: 4),
                          Text(
                            activity,
                            style: TextStyle(
                              fontSize: 12,
                              color: color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  // _getActivityIcon dan _showAddChildDialog tidak perlu diubah
  IconData _getActivityIcon(String activity) {
    // ... isi fungsi sama seperti sebelumnya
    switch (activity.toLowerCase()) {
      case 'watching youtube': return Icons.play_circle_outline;
      case 'using instagram': return Icons.camera_alt;
      case 'playing games': return Icons.videogame_asset;
      case 'Browse web': return Icons.web;
      case 'discord chat': return Icons.chat;
      case 'watching tiktok': return Icons.music_note;
      case 'educational apps': return Icons.school;
      case 'video calls': return Icons.video_call;
      case 'drawing app': return Icons.brush;
      default: return Icons.phone_android;
    }
  }

  void _showAddChildDialog(BuildContext context) {
    // ... isi fungsi sama seperti sebelumnya
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New Child'),
        content: const SingleChildScrollView( /* ... */ ),
        actions: [ /* ... */ ],
      );
    });
  }
}