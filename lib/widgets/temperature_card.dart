import 'package:flutter/material.dart';

class TemperatureCard extends StatelessWidget {
  
final double tempValue;
final Function(double) tempChange;

  const TemperatureCard({Key? key, required this.tempValue, required this.tempChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: Colors.black.withOpacity(0.2),
      ),
      child: Padding(padding: const EdgeInsets.all(10.0), child: 
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Temperature",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '15°C',
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Slider(
                      min: 15,
                      max: 30,
                      value: tempValue,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white30,
                      onChanged: tempChange),
                ),
                const Text(
                  '30°C',
                  style: TextStyle(color: Colors.white),
                ),
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
