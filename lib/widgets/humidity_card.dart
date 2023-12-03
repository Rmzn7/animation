import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HumidityCard extends StatefulWidget {
  const HumidityCard({super.key});

  @override
  State<HumidityCard> createState() => _HumidityCardState();

}

class _HumidityCardState extends State<HumidityCard> {
  Timer? timer;
  var _humidityValue = 0;
@override
void initState() {
  super.initState();
  timer = Timer.periodic(const Duration(seconds: 5), (Timer t) => _changeHumidity());
}

void _changeHumidity(){
  setState(() {
    _humidityValue = Random().nextInt(30);
  });
}


@override
void dispose() {
  timer?.cancel();
  super.dispose();
}

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Humidity",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text('$_humidityValue%', style: const TextStyle(fontSize: 36),),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),

    );
  }
}