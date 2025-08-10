import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Fokal Notifications'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read),
            onPressed: () {
              // Mark all as read functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All notifications marked as read'),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Critical Alerts Section
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Critical Alerts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          _buildNotificationCard(
            context: context,
            title: 'Explicit Image Detected',
            message:
                'Inappropriate visual content found in Instagram - Immediate attention required',
            time: '5 min ago',
            icon: Icons.warning,
            iconColor: Colors.red,
            isUnread: true,
            severity: 'ALERT',
            appSource: 'Instagram',
            detectionType: 'Visual Content',
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Explicit Text Detected',
            message: 'Inappropriate text content found in WhatsApp chat',
            time: '12 min ago',
            icon: Icons.chat_bubble_outline,
            iconColor: Colors.orange,
            isUnread: true,
            severity: 'REVIEW',
            appSource: 'WhatsApp',
            detectionType: 'Text Content',
          ),
          const SizedBox(height: 24),

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
            context: context,
            title: 'Suspicious Content Blocked',
            message:
                'Potentially harmful website access prevented in Chrome browser',
            time: '2 hours ago',
            icon: Icons.shield,
            iconColor: Colors.green,
            isUnread: false,
            severity: 'IGNORE',
            appSource: 'Chrome',
            detectionType: 'URL Blocking',
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'AI Vision Alert',
            message:
                'Multiple explicit images detected during YouTube browsing session',
            time: '3 hours ago',
            icon: Icons.visibility_off,
            iconColor: Colors.red,
            isUnread: false,
            severity: 'ALERT',
            appSource: 'YouTube',
            detectionType: 'Visual Content',
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Screen Time Report',
            message: 'Daily monitoring summary: 3 detections, 2 blocks',
            time: '6 hours ago',
            icon: Icons.assessment,
            iconColor: Colors.blue,
            isUnread: false,
            severity: 'INFO',
            appSource: 'System',
            detectionType: 'Report',
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
            context: context,
            title: 'Content Filter Updated',
            message: 'AI model updated with new detection patterns',
            time: 'Yesterday, 8:30 PM',
            icon: Icons.update,
            iconColor: Colors.teal,
            isUnread: false,
            severity: 'INFO',
            appSource: 'System',
            detectionType: 'System Update',
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Multiple Violations',
            message:
                'High-risk content detected across multiple social media apps',
            time: 'Yesterday, 3:15 PM',
            icon: Icons.dangerous,
            iconColor: Colors.red,
            isUnread: false,
            severity: 'ALERT',
            appSource: 'Multiple Apps',
            detectionType: 'Mixed Content',
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Weekly Safety Report',
            message: 'Your child\'s digital safety summary is ready',
            time: 'Yesterday, 10:00 AM',
            icon: Icons.security,
            iconColor: Colors.purple,
            isUnread: false,
            severity: 'INFO',
            appSource: 'System',
            detectionType: 'Report',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required BuildContext context,
    required String title,
    required String message,
    required String time,
    required IconData icon,
    required Color iconColor,
    required bool isUnread,
    required String severity,
    required String appSource,
    required String detectionType,
  }) {
    Color getBorderColor() {
      switch (severity) {
        case 'ALERT':
          return Colors.red.withOpacity(0.5);
        case 'REVIEW':
          return Colors.orange.withOpacity(0.5);
        default:
          return isUnread ? Colors.purple.withOpacity(0.3) : Colors.transparent;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: getBorderColor(), width: 1.5),
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
          child: Icon(icon, color: iconColor, size: 24),
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
            if (severity == 'ALERT')
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'URGENT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (isUnread && severity != 'ALERT')
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
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 12, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    appSource,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          // Navigate to appropriate report type
          if (detectionType == 'Report' && title.contains('Screen Time')) {
            _showScreenTimeReport(context);
          } else if (detectionType == 'System Update' &&
              title.contains('Content Filter')) {
            _showContentFilterReport(context);
          } else if (detectionType == 'Report' &&
              title.contains('Safety Report')) {
            _showWeeklySafetyReport(context);
          } else {
            _showDetectionReport(
              context,
              title,
              appSource,
              detectionType,
              severity,
              time,
            );
          }
        },
      ),
    );
  }

  void _showDetectionReport(
    BuildContext context,
    String title,
    String appSource,
    String detectionType,
    String severity,
    String time,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    Row(
                      children: [
                        Icon(
                          severity == 'ALERT'
                              ? Icons.warning
                              : severity == 'REVIEW'
                              ? Icons.info
                              : Icons.check_circle,
                          color: severity == 'ALERT'
                              ? Colors.red
                              : severity == 'REVIEW'
                              ? Colors.orange
                              : Colors.green,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    _buildReportSection('Detection Details', [
                      _buildReportItem('App Source', appSource),
                      _buildReportItem('Detection Type', detectionType),
                      _buildReportItem('Severity Level', severity),
                      _buildReportItem('Detection Time', time),
                      _buildReportItem('AI Confidence', '94.2%'),
                    ]),

                    const SizedBox(height: 20),

                    if (detectionType.contains('Visual') ||
                        detectionType.contains('Image'))
                      _buildScreenshotSection(),

                    if (detectionType.contains('Text'))
                      _buildTextContentSection(),

                    const SizedBox(height: 20),

                    _buildReportSection('Recommended Actions', [
                      _buildActionItem(
                        'Talk to your child about online safety',
                      ),
                      _buildActionItem('Review and adjust app restrictions'),
                      _buildActionItem('Enable stricter content filtering'),
                      _buildActionItem('Schedule regular device check-ins'),
                    ]),

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Export or share report
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Report exported successfully'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Export Report'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildReportItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.arrow_right, size: 16, color: Colors.purple),
          const SizedBox(width: 8),
          Expanded(child: Text(action, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildScreenshotSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Screenshot Evidence',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 48, color: Colors.grey),
                SizedBox(height: 8),
                Text(
                  'Screenshot captured at detection time',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  '[Content blurred for privacy]',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTextContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Detected Text Content',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red[200]!),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explicit text detected via OCR analysis:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '[Content censored for privacy protection]',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'AI Confidence: 94.2% explicit content match',
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _showScreenTimeReport(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        minChildSize: 0.6,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.assessment,
                            color: Colors.blue,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Daily Screen Time Report',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Today - August 10, 2025',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Summary Cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildSummaryCard(
                            'Total Screen Time',
                            '4h 23m',
                            Colors.blue,
                            Icons.phone_android,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSummaryCard(
                            'Detections',
                            '3',
                            Colors.red,
                            Icons.warning,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildSummaryCard(
                            'Blocks',
                            '2',
                            Colors.green,
                            Icons.shield,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSummaryCard(
                            'Apps Monitored',
                            '8',
                            Colors.purple,
                            Icons.apps,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // App Usage Breakdown
                    _buildReportSection('App Usage Breakdown', [
                      _buildAppUsageItem(
                        'Instagram',
                        '1h 45m',
                        '2 detections',
                        Colors.pink,
                      ),
                      _buildAppUsageItem(
                        'YouTube',
                        '1h 12m',
                        '1 detection',
                        Colors.red,
                      ),
                      _buildAppUsageItem(
                        'WhatsApp',
                        '58m',
                        '1 block',
                        Colors.green,
                      ),
                      _buildAppUsageItem(
                        'Chrome',
                        '43m',
                        '1 block',
                        Colors.blue,
                      ),
                      _buildAppUsageItem(
                        'TikTok',
                        '32m',
                        'Clean',
                        Colors.purple,
                      ),
                      _buildAppUsageItem(
                        'Other Apps',
                        '13m',
                        'Clean',
                        Colors.grey,
                      ),
                    ]),
                    const SizedBox(height: 20),

                    // Detection Timeline
                    _buildReportSection('Detection Timeline', [
                      _buildTimelineItem(
                        '2:30 PM',
                        'Instagram',
                        'Explicit image blocked',
                        Colors.red,
                      ),
                      _buildTimelineItem(
                        '1:45 PM',
                        'YouTube',
                        'Inappropriate video detected',
                        Colors.orange,
                      ),
                      _buildTimelineItem(
                        '11:20 AM',
                        'WhatsApp',
                        'Suspicious link blocked',
                        Colors.green,
                      ),
                      _buildTimelineItem(
                        '10:15 AM',
                        'Chrome',
                        'Adult website blocked',
                        Colors.blue,
                      ),
                    ]),
                    const SizedBox(height: 20),

                    // Recommendations
                    _buildReportSection('AI Recommendations', [
                      _buildRecommendationItem(
                        'Consider reducing Instagram usage time',
                        Icons.schedule,
                      ),
                      _buildRecommendationItem(
                        'Enable stricter YouTube content filtering',
                        Icons.video_settings,
                      ),
                      _buildRecommendationItem(
                        'Review WhatsApp contact list',
                        Icons.contacts,
                      ),
                      _buildRecommendationItem(
                        'Schedule device-free time after 9 PM',
                        Icons.bedtime,
                      ),
                    ]),
                    const SizedBox(height: 30),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                            label: const Text('Close'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Report exported to email'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.share),
                            label: const Text('Share Report'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showContentFilterReport(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        minChildSize: 0.6,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.update,
                            color: Colors.teal,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Content Filter Update',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Version 2.4.1 - Applied Successfully',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Update Status
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.green.withOpacity(0.3),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Update Applied Successfully',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  'All AI models updated and running optimally',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // What's New
                    _buildReportSection('What\'s New in This Update', [
                      _buildUpdateFeature(
                        'Enhanced Image Detection',
                        'Improved YOLO v5 model with 15% better accuracy for explicit image detection',
                        Icons.image,
                        Colors.purple,
                      ),
                      _buildUpdateFeature(
                        'Advanced Text Analysis',
                        'New NLP patterns to detect sophisticated text-based explicit content',
                        Icons.text_fields,
                        Colors.blue,
                      ),
                      _buildUpdateFeature(
                        'Social Media Monitoring',
                        'Extended support for TikTok, Snapchat, and Discord content filtering',
                        Icons.social_distance,
                        Colors.pink,
                      ),
                      _buildUpdateFeature(
                        'Performance Optimization',
                        '30% faster real-time processing with reduced battery consumption',
                        Icons.speed,
                        Colors.orange,
                      ),
                    ]),
                    const SizedBox(height: 20),

                    // Detection Improvements
                    _buildReportSection('Detection Accuracy Improvements', [
                      _buildImprovementStat(
                        'Visual Content Detection',
                        '94.2%',
                        '+5.3%',
                        Colors.red,
                      ),
                      _buildImprovementStat(
                        'Text Content Detection',
                        '91.7%',
                        '+8.1%',
                        Colors.orange,
                      ),
                      _buildImprovementStat(
                        'False Positive Rate',
                        '2.1%',
                        '-1.8%',
                        Colors.green,
                      ),
                      _buildImprovementStat(
                        'Processing Speed',
                        '0.3s',
                        '-0.1s',
                        Colors.blue,
                      ),
                    ]),
                    const SizedBox(height: 20),

                    // New Blocked Patterns
                    _buildReportSection('New Detection Patterns Added', [
                      _buildPatternItem(
                        'Advanced deepfake detection algorithms',
                      ),
                      _buildPatternItem(
                        'Encrypted messaging explicit content scanning',
                      ),
                      _buildPatternItem(
                        'Voice message content analysis (beta)',
                      ),
                      _buildPatternItem(
                        'Multi-language explicit text detection',
                      ),
                      _buildPatternItem(
                        'Cartoon/anime inappropriate content recognition',
                      ),
                    ]),
                    const SizedBox(height: 30),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                            label: const Text('Close'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Update details saved'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.download),
                            label: const Text('Download Log'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showWeeklySafetyReport(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        minChildSize: 0.6,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.security,
                            color: Colors.purple,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weekly Safety Report',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'August 4 - August 10, 2025',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Safety Score
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.withOpacity(0.1),
                            Colors.blue.withOpacity(0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.green.withOpacity(0.3),
                        ),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Digital Safety Score',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '87',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                '/100',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Good - Well Protected',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Weekly Statistics
                    Row(
                      children: [
                        Expanded(
                          child: _buildWeeklyStatCard(
                            'Total Detections',
                            '18',
                            '-12% from last week',
                            Colors.orange,
                            Icons.visibility,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildWeeklyStatCard(
                            'Blocked Content',
                            '11',
                            '+5% from last week',
                            Colors.red,
                            Icons.block,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildWeeklyStatCard(
                            'Safe Hours',
                            '28.5h',
                            '92% of total time',
                            Colors.green,
                            Icons.verified_user,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildWeeklyStatCard(
                            'Risk Level',
                            'Low',
                            'Consistent trend',
                            Colors.blue,
                            Icons.trending_down,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Daily Breakdown
                    _buildReportSection('Daily Safety Breakdown', [
                      _buildDailySafety('Monday', 8.5, 2, 1, Colors.green),
                      _buildDailySafety('Tuesday', 7.2, 4, 2, Colors.orange),
                      _buildDailySafety('Wednesday', 6.8, 1, 1, Colors.green),
                      _buildDailySafety('Thursday', 9.1, 3, 2, Colors.orange),
                      _buildDailySafety('Friday', 8.7, 5, 3, Colors.red),
                      _buildDailySafety('Saturday', 10.2, 2, 1, Colors.green),
                      _buildDailySafety('Sunday', 9.8, 1, 1, Colors.green),
                    ]),
                    const SizedBox(height: 20),

                    // Risk Assessment
                    _buildReportSection('Risk Assessment', [
                      _buildRiskItem(
                        'Social Media Usage',
                        'Moderate Risk',
                        'High activity on Instagram and TikTok',
                        Colors.orange,
                      ),
                      _buildRiskItem(
                        'Browser Activity',
                        'Low Risk',
                        'Safe browsing patterns observed',
                        Colors.green,
                      ),
                      _buildRiskItem(
                        'Messaging Apps',
                        'Low Risk',
                        'No concerning conversations detected',
                        Colors.green,
                      ),
                      _buildRiskItem(
                        'Video Content',
                        'Moderate Risk',
                        'Some inappropriate content blocked on YouTube',
                        Colors.orange,
                      ),
                    ]),
                    const SizedBox(height: 20),

                    // Recommendations
                    _buildReportSection('Weekly Recommendations', [
                      _buildWeeklyRecommendation(
                        'Review Instagram Following List',
                        'Several detections from followed accounts this week',
                        Icons.people,
                        Colors.orange,
                      ),
                      _buildWeeklyRecommendation(
                        'Set YouTube Viewing Time Limits',
                        'Consider reducing daily YouTube usage during weekdays',
                        Icons.schedule,
                        Colors.blue,
                      ),
                      _buildWeeklyRecommendation(
                        'Enable Bedtime Mode',
                        'No device usage detected after 10 PM - great job!',
                        Icons.bedtime,
                        Colors.green,
                      ),
                    ]),
                    const SizedBox(height: 30),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                            label: const Text('Close'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Weekly report exported to PDF',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.picture_as_pdf),
                            label: const Text('Export PDF'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widgets for the reports
  Widget _buildSummaryCard(
    String title,
    String value,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAppUsageItem(
    String app,
    String duration,
    String status,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.apps, color: color, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  duration,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status.contains('Clean')
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 10,
                color: status.contains('Clean') ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    String time,
    String app,
    String event,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  event,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(String recommendation, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Text(recommendation, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateFeature(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImprovementStat(
    String metric,
    String current,
    String change,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(metric, style: const TextStyle(fontSize: 14))),
          Text(
            current,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              change,
              style: TextStyle(
                fontSize: 10,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatternItem(String pattern) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.fiber_new, size: 14, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(pattern, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  Widget _buildWeeklyStatCard(
    String title,
    String value,
    String change,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            change,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildDailySafety(
    String day,
    double hours,
    int detections,
    int blocks,
    Color riskColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              day,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text('${hours}h', style: const TextStyle(fontSize: 13)),
                const SizedBox(width: 16),
                Icon(Icons.warning, size: 14, color: Colors.orange),
                const SizedBox(width: 4),
                Text('$detections', style: const TextStyle(fontSize: 13)),
                const SizedBox(width: 16),
                Icon(Icons.block, size: 14, color: Colors.red),
                const SizedBox(width: 4),
                Text('$blocks', style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: riskColor, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskItem(
    String category,
    String level,
    String description,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        level,
                        style: TextStyle(
                          fontSize: 10,
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyRecommendation(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
