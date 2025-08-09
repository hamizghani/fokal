import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read),
            onPressed: () {
              // Mark all as read functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Today Section
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          _buildNotificationCard(
            title: 'Soccer Practice Reminder',
            message: 'Emma has soccer practice in 1 hour at Central Park',
            time: '15 min ago',
            icon: Icons.sports_soccer,
            iconColor: Colors.green,
            isUnread: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            title: 'Activity Completed',
            message: 'Alex completed piano practice - Great job!',
            time: '2 hours ago',
            icon: Icons.check_circle,
            iconColor: Colors.blue,
            isUnread: true,
          ),
          const SizedBox(height: 24),

          // Yesterday Section
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Yesterday',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          _buildNotificationCard(
            title: 'New Achievement Unlocked',
            message: 'Sophie earned a swimming badge for completing 10 laps!',
            time: 'Yesterday, 6:30 PM',
            icon: Icons.emoji_events,
            iconColor: Colors.orange,
            isUnread: false,
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            title: 'Schedule Update',
            message: 'Piano lesson moved to 3:00 PM tomorrow',
            time: 'Yesterday, 2:15 PM',
            icon: Icons.schedule,
            iconColor: Colors.purple,
            isUnread: false,
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            title: 'Weekly Report Ready',
            message: 'Your weekly activity summary is now available',
            time: 'Yesterday, 10:00 AM',
            icon: Icons.assessment,
            iconColor: Colors.teal,
            isUnread: false,
          ),
          const SizedBox(height: 24),

          // This Week Section
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'This Week',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          _buildNotificationCard(
            title: 'Payment Reminder',
            message: 'Swimming class fees are due in 3 days',
            time: '3 days ago',
            icon: Icons.payment,
            iconColor: Colors.red,
            isUnread: false,
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            title: 'New Activity Available',
            message: 'Art class now available for booking this summer',
            time: '5 days ago',
            icon: Icons.palette,
            iconColor: Colors.pink,
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String message,
    required String time,
    required IconData icon,
    required Color iconColor,
    required bool isUnread,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isUnread ? Border.all(color: Colors.purple.withOpacity(0.3), width: 1) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isUnread ? FontWeight.w600 : FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            if (isUnread)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}