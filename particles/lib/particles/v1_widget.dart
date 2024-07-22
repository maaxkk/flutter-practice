import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

Random _random = Random();

double doubleInRange(double start, double end) {
  return _random.nextDouble() * (end - start) + start;
}

class SimpleParticleSystem extends StatefulWidget {
  final double x;
  final double y;

  const SimpleParticleSystem(this.x, this.y, {super.key});

  @override
  State<SimpleParticleSystem> createState() => _SimpleParticleSystemState();
}

class _SimpleParticleSystemState extends State<SimpleParticleSystem>
    with SingleTickerProviderStateMixin {
  late final List<Particle> _particles;
  late final List<Particle> _particlesToRemove;
  late Ticker _ticker;
  ui.Image? dustImage;

  void _runTicker() {
    // Initialize particles with their starting positions and velocities

    _particles = [
      Particle(x: widget.x, y: widget.y, vx: 1, vy: 1),
      Particle(x: widget.x, y: widget.y, vx: -1, vy: -1),
      Particle(x: widget.x, y: widget.y, vx: 0, vy: 1),
      Particle(x: widget.x, y: widget.y, vx: 1, vy: 0),
      Particle(x: widget.x, y: widget.y, vx: -1, vy: 0),
      Particle(x: widget.x, y: widget.y, vx: 0, vy: -1),
      Particle(x: widget.x, y: widget.y, vx: -1, vy: 1),
      Particle(x: widget.x, y: widget.y, vx: 1, vy: -1),
    ];
    _particlesToRemove = List.empty(growable: true);

    _ticker = createTicker((elapsed) {
      for (var particle in _particles) {
        particle.update();
        if (particle.finished()) {
          _particlesToRemove.add(particle);
        }
      }

      for (var particle in _particlesToRemove) {
        _particles.remove(particle);
      }
      _particlesToRemove.clear();

      setState(() {});
    });

    _ticker.start();
  }

  void _init() async {
    final ByteData data = await rootBundle.load('assets/dust-24x24.png');
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
      return completer.complete(img);
    });
    final image = await completer.future;
    setState(() {
      dustImage = image;
    });
  }

  @override
  void initState() {
    super.initState();
    _runTicker();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: dustImage != null
          ? CustomPaint(
              painter:
                  _ParticlePainter(particles: _particles, image: dustImage),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final ui.Image? image;

  _ParticlePainter(
      {super.repaint, required this.particles, required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.setPosition(particle.x * size.width, particle.y * size.height);
      // canvas.drawCircle(
      //   Offset(particle.x, particle.y),
      //   8,
      //   Paint()..color = Color.fromARGB(particle.opacity, 255, 255, 255),
      // );
      canvas.drawImage(
        image!,
        Offset(particle.x, particle.y),
        // 8,
        Paint()..color = Color.fromARGB(particle.opacity, 255, 255, 255),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Particle {
  double x;
  double y;
  double vx;
  double vy;
  int opacity = 255;

  Particle(
      {required this.x, required this.y, required this.vx, required this.vy});

  setPosition(double xPos, double yPos) {
    if (x < 1 && y < 1) {
      x = xPos;
      y = yPos;
    }
  }

  void update() {
    x += vx;
    y += vy;
    opacity -= 3;
  }

  bool finished() {
    return opacity <= 0;
  }
}
