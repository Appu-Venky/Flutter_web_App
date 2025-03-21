import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_two/contants/constants.dart';

class Header extends StatefulWidget {
  final double scrollPosition;
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onFeaturesPressed;
  final VoidCallback onContactPressed;

  const Header({
    super.key,
    required this.scrollPosition,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onFeaturesPressed,
    required this.onContactPressed,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool get _isScrolled => widget.scrollPosition > 100;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 80,
      decoration: BoxDecoration(
        color: _isScrolled ? Colors.white : Colors.transparent,
        boxShadow: _isScrolled
            ? const [BoxShadow(color: Colors.black12, blurRadius: 10)]
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo1.png', height: 40),
            Text(
              'Victory',
              style: GoogleFonts.bodoniModa(
                  color: const Color.fromARGB(255, 34, 115, 181), fontSize: 24),
            ),
            Spacer(),
            Row(
              children: [
                _HeaderButton(
                  title: 'Home',
                  isActive: false,
                  onPressed: widget.onHomePressed,
                ),
                _HeaderButton(
                  title: 'About',
                  onPressed: widget.onAboutPressed,
                ),
                _HeaderButton(
                  title: 'Features',
                  onPressed: widget.onFeaturesPressed,
                ),
                _HeaderButton(
                  title: 'Contact',
                  onPressed: widget.onContactPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  const _HeaderButton({
    required this.title,
    this.isActive = false,
    required this.onPressed,
  });

  @override
  State<_HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<_HeaderButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              color: (_isHovered || widget.isActive)
                  ? AppColors.secondary
                  : Colors.transparent,
              width: 2,
            )),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: (_isHovered || widget.isActive)
                  ? AppColors.secondary
                  : AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
