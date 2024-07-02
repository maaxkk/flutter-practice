import 'package:ecoludeco/resources/resources.dart';
import 'package:flutter/material.dart';

class CandleDetailsMainInfoWidget extends StatelessWidget {
  const CandleDetailsMainInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPosterWidget(),
        RichText(
          text: TextSpan(
            text: 'Fresh Citrus',
          ),
        ),
        Text('123'),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(
            MyCandlesImages.candleBg,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: AspectRatio(
            aspectRatio: 5 / 7,
            child: Image.asset(
              MyCandlesImages.candleBlue,
            ),
          ),
        ),
      ],
    );
  }
}
