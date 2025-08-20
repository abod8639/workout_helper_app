import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required bool isSelected,
    required BuildContext context,
  }) {
    final color = isSelected ? Theme.of(context).primaryColor : Colors.grey;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            if (isSelected)
              const SizedBox(width: 8),
            if (isSelected)
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home_rounded,
              label: 'Home',
              onPressed: () => onTap(0),
              isSelected: currentIndex == 0,
              context: context,
            ),
            _buildNavItem(
              icon: Icons.favorite_rounded,
              label: 'Heart Rate',
              onPressed: () => onTap(1),
              isSelected: currentIndex == 1,
              context: context,
            ),
            _buildNavItem(
              icon: Icons.local_fire_department_rounded,
              label: 'Calories',
              onPressed: () => onTap(2),
              isSelected: currentIndex == 2,
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}