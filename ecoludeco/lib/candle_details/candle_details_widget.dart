import 'package:ecoludeco/candle_details/candle_details_main_info_widget.dart';
import 'package:flutter/material.dart';

class CandleDetailsWidget extends StatelessWidget {
  const CandleDetailsWidget({super.key});

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
      body: CandleDetailsMainInfoWidget(),
    );
  }
}
