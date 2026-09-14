import 'package:flutter/material.dart';
import '../widgets/order_nav_bar.dart';
import 'search_screen.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  final _fullNameController = TextEditingController(text: 'Cody Fisher');
  final _emailController =
      TextEditingController(text: 'cody.fisher45@example');
  final _dobController = TextEditingController(text: '12/07/1990');
  final _phoneController = TextEditingController(text: '1 234 453 231 506');

  String _gender = 'Male';
  final List<String> _genders = ['Male', 'Female', 'Other'];

  int _currentNavIndex = 4;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 7, 12),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text =
            '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      });
    }
  }

  void _onSubmit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Details submitted')),
    );
  }

  void _onNavTap(int index) {
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const SearchScreen()),
      );
      return;
    }
    setState(() => _currentNavIndex = index);
    // TODO: handle navigation for the other tabs (Home, Saved, Cart, Account)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'My Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Full Name'),
              _buildTextField(controller: _fullNameController),
              const SizedBox(height: 20),
              _buildLabel('Email Address'),
              _buildTextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              _buildLabel('Date of Birth'),
              _buildTextField(
                controller: _dobController,
                readOnly: true,
                onTap: _pickDate,
                suffixIcon: const Icon(Icons.calendar_today_outlined,
                    size: 20, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              _buildLabel('Gender'),
              _buildDropdown(),
              const SizedBox(height: 20),
              _buildLabel('Phone Number'),
              _buildPhoneField(),
              const SizedBox(height: 120),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OrdersBottomNav(
        selectedIndex: _currentNavIndex,
        onItemSelected: _onNavTap,
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      );

  InputDecoration _fieldDecoration({Widget? suffixIcon}) => InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF5F5F7),
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      );

  Widget _buildTextField({
    required TextEditingController controller,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      decoration: _fieldDecoration(suffixIcon: suffixIcon),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _gender,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: _genders
              .map((g) => DropdownMenuItem(value: g, child: Text(g)))
              .toList(),
          onChanged: (value) {
            if (value != null) setState(() => _gender = value);
          },
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text('🇺🇸', style: TextStyle(fontSize: 18)),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, size: 18),
              ],
            ),
          ),
          Container(width: 1, height: 24, color: Colors.black12),
          Expanded(
            child: TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                prefixText: '+',
              ),
            ),
          ),
        ],
      ),
    );
  }
}