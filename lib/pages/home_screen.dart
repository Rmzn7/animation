import 'package:animated_background/animated_background.dart';
import 'package:animation/controller/home_cubit.dart';
import 'package:animation/controller/home_state.dart';
import 'package:animation/utilities/ac_mode_colors.dart';
import 'package:animation/widgets/humidity_card.dart';
import 'package:animation/widgets/speed_card.dart';
import 'package:animation/widgets/temperature_card.dart';
import 'package:animation/widgets/temperature_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AC configurations"),
        centerTitle: true,

      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder:(context, state){
          return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.white,
                    activeColor[state.sliderProgressValue].withOpacity(0.5),
                    activeColor[state.sliderProgressValue]
                  ]),),
            child: AnimatedBackground(
                vsync: this,
                behaviour: RandomParticleBehaviour(options: ParticleOptions(
                   baseColor: const Color(0xFFFFFFFF),
                opacityChangeRate: 0.25,
                minOpacity: 0.1,
                maxOpacity: 0.3,
                spawnMinSpeed: state.speed * 60.0,
                spawnMaxSpeed: state.speed * 140,
                spawnMinRadius: 2.0,
                spawnMaxRadius: 5.0,
                particleCount: state.speed * 200,
              ) 
                ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30,),
                      TemperatureSlider(progressValue: state.sliderProgressValue, color: activeColor[state.sliderProgressValue], onChange: context.read<HomeCubit>().onTempChanged),
                      const SizedBox(height: 50,),
                      TemperatureCard(tempValue: state.temperature, tempChange: context.read<HomeCubit>().onTempChanged),
                      const SizedBox(height: 30,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpeedCard(currentSpeed: state.speed, buttonPressed: context.read<HomeCubit>().changeSpeed),
                          const SizedBox(width: 15,),
                          const HumidityCard(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        } ,
      ),
    );
  }
}