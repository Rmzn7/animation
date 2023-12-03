import 'package:flutter/material.dart';

class SpeedCard extends StatelessWidget {
  const SpeedCard({super.key, required this.currentSpeed, required this.buttonPressed});
  final int currentSpeed;
  final Function(int) buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 240,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: Colors.black.withOpacity(0.2),
      ),
      child: Padding(padding: const EdgeInsets.all(8.0), child: 
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Speed",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: currentSpeed == 1 ? null : ()=> buttonPressed(1), child: const Text('1'), ),
                ElevatedButton(onPressed: currentSpeed == 2 ? null : ()=> buttonPressed(2), child: const Text('2'), ),
                ElevatedButton(onPressed: currentSpeed == 3 ? null : ()=> buttonPressed(3), child: const Text('3'), ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),

    );
  }
}