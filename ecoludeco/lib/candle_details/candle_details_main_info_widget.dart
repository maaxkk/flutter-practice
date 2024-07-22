import 'package:ecoludeco/Theme/theme_colors.dart';
import 'package:ecoludeco/candle_details/rating_widget.dart';
import 'package:ecoludeco/resources/resources.dart';
import 'package:flutter/material.dart';

class CandleDetailsMainInfoWidget extends StatelessWidget {
  const CandleDetailsMainInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        SizedBox(height: 10),
        _CandleNameWidget(),
        _RatingWidget(),
        _CandleMaterialsWidget(),
        _DescriptionWidget(),
        _CandleDescriptionWidget(),
        _CandleFieldsWidget(),
      ],
    );
  }
}

class _RatingWidget extends StatelessWidget {
  const _RatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: RadialPercentWidget(
                  percent: 0.86,
                  fillColor: const Color.fromARGB(255, 10, 23, 25),
                  lineColor: const Color.fromARGB(255, 37, 203, 103),
                  freeColor: const Color(0xff204529),
                  lineWidth: 3,
                  child: const Text(
                    '86',
                    style: TextStyle(
                      color: Color.fromARGB(255, 37, 203, 103),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text('Candle rating', style: TextStyle(color: ThemeColors.light.blueColor),),
            ],
          ),
        ),
        Container(width: 1, height: 20, color: Colors.grey),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.rate_review_outlined, color: ThemeColors.light.blueColor),
              const SizedBox(
                width: 5,
              ),
              Text('Candle reviews', style: TextStyle(color: ThemeColors.light.blueColor),),
            ],
          ),
        ),
      ],
    );
  }
}

class _CandleFieldsWidget extends StatelessWidget {
  const _CandleFieldsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey),
                      top: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text('Category'),
                      ),
                      Expanded(
                        child: Text('Aroma', textAlign: TextAlign.end),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text('Weight'),
                      ),
                      Expanded(
                        child: Text('100gr.', textAlign: TextAlign.end),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Text('Blue', textAlign: TextAlign.end),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CandleDescriptionWidget extends StatelessWidget {
  const _CandleDescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child:
          Text("An invigorating combination of zesty lemon and vibrant orange "
              "essential oils, our Fresh Citrus Candle is designed to refresh "
              "and uplift your space with a bright, energizing aroma."
              " Experience the burst of citrus that will rejuvenate your"
              " senses and create a lively atmosphere in any room."),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Description',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _CandleMaterialsWidget extends StatelessWidget {
  const _CandleMaterialsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Text('100% natural soy wax,'
          ' premium essential oils (lemon, lime, orange), lead-free '
          'cotton wick, reusable glass jar, and non-toxic plant-based dye.'),
    );
  }
}

class _CandleNameWidget extends StatelessWidget {
  const _CandleNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          maxLines: 3,
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Fresh Citrus',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 21,
                ),
              ),
              TextSpan(
                text: ' (aroma)',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
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
