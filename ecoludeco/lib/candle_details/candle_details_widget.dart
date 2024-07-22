import 'package:ecoludeco/candle_details/candle_details_main_info_widget.dart';
import 'package:ecoludeco/candle_details/candle_details_other_candles_widget.dart';
import 'package:flutter/material.dart';

class CandleDetailsWidget extends StatelessWidget {
  final int candleId;
  const CandleDetailsWidget({super.key, required this.candleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fresh Citrus',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ColoredBox(
        color: const Color(0xFFF5F7FB),
        child: ListView(
          children: const [
            CandleDetailsMainInfoWidget(),
            CandleDetailsOtherCandlesWidget(),
          ],
        ),
      ),
    );
  }
}
