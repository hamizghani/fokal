import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Edit profile functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Text(
                      'JD',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'john.doe@email.com',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('3', 'Children'),
                      _buildStatItem('12', 'Activities'),
                      _buildStatItem('2', 'Years'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Device Pairing Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Device Management',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildSettingsCard([
                    _buildSettingsItem(
                      Icons.link,
                      'Pair Child Device',
                      'Connect your child\'s device to yours',
                      () => _showPairDeviceDialog(context),
                    ),
                    
                  ]),

                  const SizedBox(height: 24),

                  // Account Settings
                  const Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildSettingsCard([
                    _buildSettingsItem(
                      Icons.person,
                      'Profile Settings',
                      'Update your personal information',
                      () {},
                    ),
                    _buildSettingsItem(
                      Icons.notifications,
                      'Notifications',
                      'Manage your notification preferences',
                      () {},
                    ),
                    _buildSettingsItem(
                      Icons.security,
                      'Privacy & Security',
                      'Password and security settings',
                      () {},
                    ),
                  ]),

                  const SizedBox(height: 24),
                  const Text(
                    'App Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildSettingsCard([
                    _buildSettingsItem(
                      Icons.child_care,
                      'Child Management',
                      'Add or manage your children profiles',
                      () {},
                    ),
                    _buildSettingsItem(
                      Icons.payment,
                      'Payment Methods',
                      'Manage cards and payment options',
                      () {},
                    ),
                    _buildSettingsItem(
                      Icons.history,
                      'Activity History',
                      'View past activities and progress',
                      () {},
                    ),
                  ]),

                  const SizedBox(height: 24),
                  const Text(
                    'Support',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildSettingsCard([
                    _buildSettingsItem(
                      Icons.help,
                      'Help Center',
                      'Get help and find answers',
                      () {},
                    ),
                    _buildSettingsItem(
                      Icons.feedback,
                      'Send Feedback',
                      'Share your thoughts with us',
                      () {},
                    ),
                    _buildSettingsItem(
                      Icons.info,
                      'About',
                      'App version and information',
                      () {},
                    ),
                  ]),

                  const SizedBox(height: 32),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showLogoutDialog(context);
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildSettingsCard(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: items),
    );
  }

  Widget _buildSettingsItem(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.purple, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  void _showPairDeviceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const DevicePairingBottomSheet(),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add logout functionality here
                // For example: Navigator.of(context).pushReplacementNamed('/login');
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

// Device Pairing Bottom Sheet
class DevicePairingBottomSheet extends StatefulWidget {
  const DevicePairingBottomSheet({super.key});

  @override
  State<DevicePairingBottomSheet> createState() =>
      _DevicePairingBottomSheetState();
}

class _DevicePairingBottomSheetState extends State<DevicePairingBottomSheet> {
  int currentStep = 0;
  String pairingCode = '';
  bool isGeneratingCode = false;
  bool isPairing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
                const Expanded(
                  child: Text(
                    'Pair Child Device',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
            const SizedBox(height: 32),
            _buildPairingContent(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPairingContent() {
    switch (currentStep) {
      case 0:
        return _buildStepSelection();
      case 1:
        return _buildGenerateCode();
      case 2:
        return _buildEnterCode();
      default:
        return _buildStepSelection();
    }
  }

  Widget _buildStepSelection() {
    return Column(
      children: [
        const Text(
          'How would you like to pair?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        _buildPairingOption(
          icon: Icons.qr_code_2,
          title: 'Generate Pairing Code',
          subtitle: 'Create a code for your child to enter',
          onTap: () => setState(() => currentStep = 1),
        ),
        const SizedBox(height: 16),
        _buildPairingOption(
          icon: Icons.input,
          title: 'Enter Pairing Code',
          subtitle: 'Enter the code from your child\'s device',
          onTap: () => setState(() => currentStep = 2),
        ),
      ],
    );
  }

  Widget _buildPairingOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.purple, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildGenerateCode() {
    return Column(
      children: [
        const Icon(Icons.devices, size: 64, color: Colors.purple),
        const SizedBox(height: 24),
        const Text(
          'Share this code with your child',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          'Ask your child to enter this code in their device',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        if (pairingCode.isEmpty) ...[
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: isGeneratingCode ? null : _generatePairingCode,
              icon: isGeneratingCode
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.refresh),
              label: Text(isGeneratingCode ? 'Generating...' : 'Generate Code'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ] else ...[
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.purple.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Text(
                  pairingCode,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: _copyCode,
                      icon: const Icon(Icons.copy, size: 16),
                      label: const Text('Copy Code'),
                    ),
                    const SizedBox(width: 16),
                    TextButton.icon(
                      onPressed: _generatePairingCode,
                      icon: const Icon(Icons.refresh, size: 16),
                      label: const Text('New Code'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Code expires in 5 minutes',
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
        const SizedBox(height: 24),
        TextButton(
          onPressed: () => setState(() => currentStep = 0),
          child: const Text('Back to options'),
        ),
      ],
    );
  }

  Widget _buildEnterCode() {
    final TextEditingController codeController = TextEditingController();

    return Column(
      children: [
        const Icon(Icons.input, size: 64, color: Colors.purple),
        const SizedBox(height: 24),
        const Text(
          'Enter pairing code',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the 6-digit code from your child\'s device',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        TextField(
          controller: codeController,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
          maxLength: 6,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: '000000',
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.purple),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.purple, width: 2),
            ),
            counterText: '',
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onChanged: (value) {
            if (value.length == 6) {
              _pairWithCode(value);
            }
          },
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: isPairing
                ? null
                : () {
                    if (codeController.text.length == 6) {
                      _pairWithCode(codeController.text);
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: isPairing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text('Pair Device'),
          ),
        ),
        const SizedBox(height: 24),
        TextButton(
          onPressed: () => setState(() => currentStep = 0),
          child: const Text('Back to options'),
        ),
      ],
    );
  }

  void _generatePairingCode() {
    setState(() {
      isGeneratingCode = true;
    });

    // Simulate code generation
    Future.delayed(const Duration(seconds: 1), () {
      final random = DateTime.now().millisecondsSinceEpoch;
      setState(() {
        pairingCode = (random % 1000000).toString().padLeft(6, '0');
        isGeneratingCode = false;
      });
    });
  }

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: pairingCode));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Code copied to clipboard')));
  }

  void _pairWithCode(String code) {
    setState(() {
      isPairing = true;
    });

    // Simulate pairing process
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isPairing = false;
      });
      Navigator.pop(context);
      _showPairingSuccessDialog(context);
    });
  }

  void _showPairingSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Device Paired Successfully!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'You can now monitor and manage your child\'s activities.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Paired Devices Screen
class PairedDevicesScreen extends StatelessWidget {
  const PairedDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paired Devices'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Connected Devices',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDeviceCard(
              'Emma\'s Phone',
              'iPhone 12',
              'Connected • Last seen 2 min ago',
              Icons.phone_iphone,
              Colors.green,
            ),
            const SizedBox(height: 12),
            _buildDeviceCard(
              'Alex\'s Tablet',
              'iPad Air',
              'Connected • Last seen 1 hour ago',
              Icons.tablet_mac,
              Colors.green,
            ),
            const SizedBox(height: 12),
            _buildDeviceCard(
              'Sophie\'s Phone',
              'Samsung Galaxy',
              'Offline • Last seen yesterday',
              Icons.phone_android,
              Colors.grey,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const DevicePairingBottomSheet(),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New Device'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceCard(
    String name,
    String model,
    String status,
    IconData icon,
    Color statusColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.purple, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  model,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: statusColor),
                    const SizedBox(width: 4),
                    Text(
                      status,
                      style: TextStyle(fontSize: 12, color: statusColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Show device options
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
