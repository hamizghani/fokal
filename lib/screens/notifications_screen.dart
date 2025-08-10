import 'package:flutter/material.dart';
import 'dart:ui'; // Import dart:ui for ImageFilter

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
            title: 'Pornography Detected (Implicit)',
            message:
                'Inappropriate visual content found on Tomi\'s Phone - Immediate attention required',
            time: '2 min ago',
            icon: Icons.warning,
            iconColor: const Color(0xFFE53935),
            isUnread: true,
            severity: 'ALERT',
            appSource: 'Tomi\'s Phone',
            detectionType: 'Visual Content',
            confidence: '85%',
            imagePath: 'lib/assets/images/imagedetect.png',
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Pornotext Detected',
            message: 'Inappropriate text content found on Alex\'s Phone',
            time: '15 min ago',
            icon: Icons.message,
            iconColor: const Color(0xFFFF9800),
            isUnread: true,
            severity: 'REVIEW',
            appSource: 'Alex\'s Phone',
            detectionType: 'Text Content',
            confidence: '100%',
            imagePath: 'lib/assets/images/pornotext_detected.png',
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
            title: 'Safe Mode Disabled Attempt',
            message:
                'Unauthorized attempt to disable safe mode detected on Sophie\'s Tablet',
            time: '1 hour ago',
            icon: Icons.security,
            iconColor: const Color(0xFFE53935),
            isUnread: true,
            severity: 'ALERT',
            appSource: 'Sophie\'s Tablet',
            detectionType: 'Security Breach',
            confidence: '80%',
            imagePath: null, // No image for security breach
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Pornography Detected (Implicit)',
            message:
                'Inappropriate visual content detected on Tomi\'s Phone during Browse session',
            time: '2 hours ago',
            icon: Icons.warning,
            iconColor: const Color(0xFFE53935),
            isUnread: false,
            severity: 'ALERT',
            appSource: 'Tomi\'s Phone',
            detectionType: 'Visual Content',
            confidence: '90%',
            imagePath: 'lib/assets/images/imagedetect2.png',
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Pornography Detected (Explicit)',
            message:
                'Explicit visual content found on Juna\'s Phone - Immediate review needed',
            time: '3 hours ago',
            icon: Icons.warning,
            iconColor: const Color(0xFFE53935),
            isUnread: false,
            severity: 'ALERT',
            appSource: 'Juna\'s Phone',
            detectionType: 'Visual Content',
            confidence: '95%',
            imagePath: 'lib/assets/images/imagedetect3.png',
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Screen Time Report',
            message: 'Daily monitoring summary: 5 detections, 3 blocks',
            time: '6 hours ago',
            icon: Icons.assessment,
            iconColor: Colors.blue,
            isUnread: false,
            severity: 'INFO',
            appSource: 'System',
            detectionType: 'Report',
            imagePath: null, // No image for reports
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
            imagePath: null, // No image for system updates
          ),
          const SizedBox(height: 12),
          _buildNotificationCard(
            context: context,
            title: 'Weekly Safety Report',
            message: 'Your family\'s digital safety summary is ready',
            time: 'Yesterday, 10:00 AM',
            icon: Icons.security,
            iconColor: Colors.purple,
            isUnread: false,
            severity: 'INFO',
            appSource: 'System',
            detectionType: 'Report',
            imagePath: null, // No image for reports
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
    String? confidence,
    String? imagePath,
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
                if (confidence != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Confidence: $confidence',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                if (confidence != null) const SizedBox(width: 8),
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
              confidence,
              imagePath,
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
    String? confidence,
    String? imagePath, // Use imagePath instead of imageUrl
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
                      _buildReportItem('Device Source', appSource),
                      _buildReportItem('Detection Type', detectionType),
                      _buildReportItem('Severity Level', severity),
                      _buildReportItem('Detection Time', time),
                      if (confidence != null)
                        _buildReportItem('AI Confidence', confidence),
                    ]),

                    const SizedBox(height: 20),

                    // Condition to show the screenshot section
                    if (detectionType.contains('Visual') ||
                        detectionType.contains('Image') ||
                        title.contains('Pornography'))
                      _buildScreenshotSection(imagePath), // Pass imagePath here

                    if (detectionType.contains('Text') ||
                        title.contains('Pornotext'))
                      _buildTextContentSection(),

                    if (detectionType.contains('Security'))
                      _buildSecurityBreachSection(),

                    const SizedBox(height: 20),

                    _buildReportSection('Recommended Actions', [
                      _buildActionItem(
                        'Have a conversation about digital safety',
                      ),
                      _buildActionItem('Review and adjust app restrictions'),
                      _buildActionItem('Enable stricter content filtering'),
                      _buildActionItem('Schedule regular device check-ins'),
                      if (detectionType.contains('Security'))
                        _buildActionItem('Reset device security settings'),
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

  // MODIFIED METHOD
  Widget _buildScreenshotSection(String? imagePath) {
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
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            title: const Text(
              'Tap to view blurred screenshot',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: imagePath != null
                    ? ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imagePath, // Use Image.asset() for local files
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                'Failed to load image.',
                                style: TextStyle(color: Colors.red),
                              );
                            },
                          ),
                        ),
                      )
                    : const Text(
                        'No screenshot available.',
                        style: TextStyle(color: Colors.grey),
                      ),
              ),
            ],
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
                'Text content flagged as inappropriate',
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // --- Bagian baru untuk melihat gambar ---
        Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            title: const Text(
              'Lihat gambar yang terdeteksi',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  'URL_GAMBAR_YANG_TERDETEKSI_DI_SINI',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Tidak dapat memuat gambar.',
                      style: TextStyle(color: Colors.grey),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityBreachSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Security Breach Details',
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
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange[200]!),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unauthorized attempt to disable protective features:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '• Safe mode disable attempt detected',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                '• Security settings access blocked',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                'Device security maintained - no breach occurred',
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // Keep all the existing report methods from the original code...
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
                            '5',
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
                            '3',
                            Colors.green,
                            Icons.shield,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSummaryCard(
                            'Devices Monitored',
                            '4',
                            Colors.purple,
                            Icons.devices,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Device Usage Breakdown
                    _buildReportSection('Device Usage Breakdown', [
                      _buildAppUsageItem(
                        'Tomi\'s Phone',
                        '1h 45m',
                        '3 detections',
                        Colors.pink,
                      ),
                      _buildAppUsageItem(
                        'Alex\'s Phone',
                        '1h 12m',
                        '1 detection',
                        Colors.orange,
                      ),
                      _buildAppUsageItem(
                        'Juna\'s Phone',
                        '58m',
                        '1 detection',
                        Colors.red,
                      ),
                      _buildAppUsageItem(
                        'Sophie\'s Tablet',
                        '43m',
                        '1 security breach',
                        Colors.blue,
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
    // Keep the existing implementation...
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
                  children: const [
                    // Content implementation continues...
                    Row(
                      children: [
                        // OutlinedButton.icon(
                        //   onPressed: () => Navigator.pop(context),
                        //   icon: const Icon(Icons.close),
                        //   label: const Text('Close'),
                        // ),
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
    // Keep the existing implementation...
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
                  children: const [
                    // Content implementation...
                    Row(
                      children: [
                        // OutlinedButton.icon(
                        //   onPressed: () => Navigator.pop(context),
                        //   icon: const Icon(Icons.close),
                        //   label: const Text('Close'),
                        // ),
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

  // Helper widgets
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
            child: Icon(Icons.phone_android, color: color, size: 16),
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
              color: status.contains('Clean') || status.contains('0')
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 10,
                color: status.contains('Clean') || status.contains('0')
                    ? Colors.green
                    : Colors.red,
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
