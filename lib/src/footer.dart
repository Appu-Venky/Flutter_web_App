import 'package:flutter/material.dart';
import 'package:project_two/contants/constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      color: AppColors.primary,
      padding:
          EdgeInsets.symmetric(vertical: 40, horizontal: isMobile ? 20 : 100),
      child: Column(
        children: [
          isMobile ? _buildMobileFooter() : _buildDesktopFooter(),
          const SizedBox(height: 40),
          const Divider(color: Colors.white54),
          const SizedBox(height: 20),
          Text(
            '© 2024 Your Company. All rights reserved',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _FooterColumn(
          title: 'About Us',
          children: [
            _FooterLink(text: 'Our Story'),
            _FooterLink(text: 'Careers'),
            _FooterLink(text: 'Blog'),
          ],
        ),
        _FooterColumn(
          title: 'Quick Links',
          children: [
            _FooterLink(text: 'Privacy Policy'),
            _FooterLink(text: 'Terms of Service'),
            _FooterLink(text: 'Documentation'),
          ],
        ),
        _FooterColumn(
          title: 'Contact',
          children: [
            _FooterLink(text: 'support@company.com'),
            _FooterLink(text: '+1 (555) 123-4567'),
            _FooterLink(text: 'New York, USA'),
          ],
        ),
        _SocialMediaLinks(),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterColumn(
          title: 'About Us',
          children: [
            _FooterLink(text: 'Our Story'),
            _FooterLink(text: 'Careers'),
            _FooterLink(text: 'Blog'),
          ],
        ),
        const SizedBox(height: 30),
        _FooterColumn(
          title: 'Quick Links',
          children: [
            _FooterLink(text: 'Privacy Policy'),
            _FooterLink(text: 'Terms of Service'),
            _FooterLink(text: 'Documentation'),
          ],
        ),
        const SizedBox(height: 30),
        _FooterColumn(
          title: 'Contact',
          children: [
            _FooterLink(text: 'support@company.com'),
            _FooterLink(text: '+1 (555) 123-4567'),
            _FooterLink(text: 'New York, USA'),
          ],
        ),
        const SizedBox(height: 30),
        _SocialMediaLinks(),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterColumn({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;

  const _FooterLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _SocialMediaLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Follow Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            _SocialIcon(icon: Icons.facebook),
            const SizedBox(width: 15),
            _SocialIcon(icon: Icons.facebook),
            const SizedBox(width: 15),
            _SocialIcon(icon: Icons.facebook),
            const SizedBox(width: 15),
            _SocialIcon(icon: Icons.facebook),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;

  const _SocialIcon({required this.icon});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.secondary : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            widget.icon,
            color: _isHovered ? Colors.white : Colors.white70,
            size: 24,
          ),
        ),
      ),
    );
  }
}
