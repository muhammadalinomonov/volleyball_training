import 'package:flutter/material.dart';

class WorkoutWidget extends StatelessWidget {
  final int completedSets = 5;
  final int totalSets = 12;
  final int remainingMinutes = 15;

  const WorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = completedSets / totalSets;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                strokeWidth: 6,
              ),

            ],
          ),
          SizedBox(height:4),
          Text(
            "$completedSets/$totalSets",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Chest Workout',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '$remainingMinutes min remaining',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
