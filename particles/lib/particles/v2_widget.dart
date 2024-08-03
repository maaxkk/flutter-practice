import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:particles/particles/block.dart';
import 'package:particles/particles/particle.dart';
import 'package:particles/particles/particle_field.dart';
import 'package:particles/particles/sprite_sheet.dart';
import 'package:rnd/rnd.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Particle Field Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (counter % 2 == 0) const ParticleFieldExample(),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text('Reload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// this is a very quick and dirty example.
class ParticleFieldExample extends StatefulWidget {
  const ParticleFieldExample({Key? key}) : super(key: key);

  @override
  _ParticleFieldExampleState createState() => _ParticleFieldExampleState();
}

class _ParticleFieldExampleState extends State<ParticleFieldExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final SpriteSheet sparkleSpriteSheet = SpriteSheet(
      image: const AssetImage('assets/dust-64x64.png'),
    );

    final ParticleField fixedParticleField = ParticleField(
      spriteSheet: sparkleSpriteSheet,
      origin: Alignment.center,
      onTick: (controller, elapsed, size) {
        List<Particle> particles = controller.particles;
        if (counter < 13) {
          int side = rnd.nextInt(4);
          double x = 0;
          double y = 0;
          double vx = 0;
          double vy = 0;
          switch (side) {
            case 0: // top
              x = 0;
              y = rnd(-17, -25);
              vx = rnd(-1, 1);
              vy = rnd(-0.25, -1.25);
              break;
            case 1: // right
              x = rnd(17,25);
              y = 0;
              vx = rnd(0.25, 1.25);
              vy = rnd(-1, 1);
              break;
            case 2: // bottom
              x = 0;
              y = rnd(40, 50);
              vx = rnd(-1, 1);
              vy = rnd(0.25, 1.25);
              break;
            case 3: // left
              x = rnd(-17, -25);
              y = 0;
              vx = rnd(-0.25, -1.25);
              vy = rnd(-1, 1);
              break;
          }
          particles.add(Particle(
            color: Colors.grey,
            x: x,
            y: y,
            vx: vx,
            vy: vy,
            frame: 60,
            lifespan: rnd(30, 80),
            scale: 0.4,
          ));
        }
        counter++;

        for (int i = particles.length - 1; i >= 0; i--) {
          Particle particle = particles[i];

          // Ensure the particles only change their vertical direction
          double newVy = particle.vy + rnd(-0.15, 0.15);

          particle.update(
            vy: newVy,
            x: particle.x + particle.vx,
            y: particle.y + particle.vy,
            scale: particle.scale + rnd(0.005, 0.01),
            opacity: particle.opacity - 0.01,
            frame: particle.frame + 1,
          );

          if (controller.opacity <= 0.0) {
            particles.removeAt(i);
            continue;
          }
        }
      },
    );

    return Column(
      children: [
        fixedParticleField.stackAbove(child: const Block()),
      ],
    );
  }
}
