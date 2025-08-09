import 'package:flutter/material.dart';

class AppUsageWidget extends StatelessWidget {
  const AppUsageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Usage Timeline Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'App Usage Timeline',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildUsageItem('YouTube', '1 hr 30 m'),
                    const SizedBox(height: 12),
                    _buildUsageItem('TikTok', '1 hr 15 m'),
                    const SizedBox(height: 12),
                    _buildUsageItem('Minecraft', '40 m'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Activity Log Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Activity Log',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildActivityItem('Instagram', 'Opened', '10:45 AM'),
                    const SizedBox(height: 12),
                    _buildActivityItem('Twitter', 'Closed', '09:30 AM'),
                    const SizedBox(height: 12),
                    _buildActivityItem('App Name', 'Context', '07:55 AM'),
                    const SizedBox(height: 12),
                    _buildActivityItem('App Name', 'Context', '07:30 AM'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsageItem(String appName, String duration) {
    return Row(
      children: [
        // App icon placeholder (black square with X)
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.close, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 12),
        // Progress bar
        Expanded(
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                // Background
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                // Progress fill (you can adjust width based on usage)
                FractionallySizedBox(
                  widthFactor: _getUsagePercentage(duration),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Duration text
        Text(
          duration,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String appName, String action, String time) {
    return Row(
      children: [
        // Circle indicator
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
        // App name and action
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                action,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        // Time
        Text(time, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }

  double _getUsagePercentage(String duration) {
    // Simple logic to convert duration to percentage for demo
    if (duration.contains('1 hr 30')) return 0.8;
    if (duration.contains('1 hr 15')) return 0.7;
    if (duration.contains('40 m')) return 0.4;
    return 0.3;
  }
}
