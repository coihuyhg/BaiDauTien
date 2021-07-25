import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Opacity(
          opacity: 0.9,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                    gradients: [
                      [
                        Colors.red[900],
                        Colors.red[900],
                      ],
                      [
                        Colors.red[900],
                        Colors.red[50],
                        Colors.red[900],
                      ]
                    ],
                    durations: [
                      19440,
                      10800
                    ],
                    heightPercentages: [
                      0.20,
                      0.25
                    ],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.topLeft,
                    gradientEnd: Alignment.bottomRight),
                waveAmplitude: 0,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
        ),
        Image.asset("assets/logo_icon.png")
      ],
    );
  }
}
