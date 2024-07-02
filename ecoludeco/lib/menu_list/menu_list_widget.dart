import 'package:ecoludeco/resources/resources.dart';
import 'package:flutter/material.dart';

class Candle {
  final String imgPath;
  final String title;
  final String category;
  final String description;

  Candle({
    required this.imgPath,
    required this.title,
    required this.category,
    required this.description,
  });
}

class MenuListWidget extends StatefulWidget {
  const MenuListWidget({super.key});

  @override
  State<MenuListWidget> createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  final _searchController = TextEditingController();
  final List<Candle> _candles = [
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Tranquil Serenity",
        category: "Relaxation",
        description:
            "A calming blend of lavender and vanilla essential oils for a serene atmosphere."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Warm Embrace",
        category: "Comfort",
        description:
            "A cozy mix of cinnamon and clove to create a warm and inviting environment."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Fresh Citrus",
        category: "Energizing",
        description:
            "An invigorating combination of lemon and orange to refresh and uplift your space."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Ocean Breeze",
        category: "Fresh",
        description:
            "A revitalizing scent of sea salt and jasmine to bring the ocean to your home."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Forest Retreat",
        category: "Nature",
        description:
            "A woodsy blend of pine and cedarwood for a natural, earthy ambiance."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Sweet Delight",
        category: "Gourmand",
        description:
            "A delightful scent of vanilla and caramel to satisfy your sweet tooth."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Spiced Apple",
        category: "Autumn",
        description:
            "A warm mix of apple and cinnamon perfect for autumn evenings."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Midnight Garden",
        category: "Floral",
        description:
            "A romantic blend of rose and jasmine for a beautiful floral fragrance."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Citrus Burst",
        category: "Summer",
        description:
            "A zesty combination of grapefruit and lime to brighten your day."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Winter Wonderland",
        category: "Winter",
        description:
            "A crisp blend of peppermint and eucalyptus to evoke the feeling of winter."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Tropical Paradise",
        category: "Exotic",
        description:
            "A vibrant mix of coconut and pineapple for a tropical escape."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Zen Garden",
        category: "Meditation",
        description:
            "A tranquil blend of sandalwood and ylang-ylang to enhance meditation."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Berry Bliss",
        category: "Fruity",
        description:
            "A sweet and tangy combination of strawberry and raspberry."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Amber Glow",
        category: "Luxury",
        description:
            "A rich blend of amber and musk for a sophisticated ambiance."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Lavender Dreams",
        category: "Sleep",
        description:
            "A soothing mix of lavender and chamomile to help you relax and sleep."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Cinnamon Spice",
        category: "Holiday",
        description:
            "A festive blend of cinnamon and clove for the holiday season."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Vanilla Bean",
        category: "Classic",
        description:
            "A timeless scent of pure vanilla bean for a cozy atmosphere."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Gardenia Bloom",
        category: "Floral",
        description: "A fresh and delicate scent of blooming gardenias."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Cedarwood Sage",
        category: "Earthy",
        description:
            "An earthy blend of cedarwood and sage for a grounding experience."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Peppermint Twist",
        category: "Refreshing",
        description: "A cool and refreshing mix of peppermint and spearmint."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Rose Petals",
        category: "Romantic",
        description: "A romantic scent of fresh rose petals to set the mood."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Pumpkin Spice",
        category: "Seasonal",
        description: "A seasonal favorite with notes of pumpkin and spices."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Eucalyptus Mint",
        category: "Revitalizing",
        description:
            "A revitalizing blend of eucalyptus and mint for a spa-like feel."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Honeysuckle",
        category: "Spring",
        description: "A light and sweet scent of honeysuckle blossoms."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Coconut Lime",
        category: "Tropical",
        description:
            "A tropical mix of coconut and lime for a refreshing escape."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Sandalwood",
        category: "Woody",
        description: "A warm and woody scent of pure sandalwood."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Lemon Verbena",
        category: "Citrus",
        description: "A fresh and clean blend of lemon verbena and lime."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Gingerbread",
        category: "Holiday",
        description:
            "A festive mix of ginger, nutmeg, and cinnamon for the holidays."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Cherry Blossom",
        category: "Floral",
        description: "A delicate and sweet scent of cherry blossoms in bloom."),
    Candle(
        imgPath: MyCandlesImages.candleBlue,
        title: "Maple Syrup",
        category: "Gourmand",
        description:
            "A rich and sweet scent of maple syrup for a cozy atmosphere."),
  ];
  var _filteredCandles = [];

  void _searchCandles() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredCandles = _candles.where((candle) {
        return candle.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredCandles = _candles;
    }
    setState(() {});
  }

  void _openCandleDetails() {
    Navigator.of(context).pushNamed('/main_screen/candle_details');
  }

  @override
  void initState() {
    super.initState();
    _searchCandles();
    _searchController.addListener(_searchCandles);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70.0),
          itemCount: _filteredCandles.length,
          itemExtent: 180,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (BuildContext context, int index) {
            final candle = _filteredCandles[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image(image: AssetImage(candle.imgPath)),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                candle.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                candle.category,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                candle.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _openCandleDetails,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
            ),
            controller: _searchController,
          ),
        ),
      ],
    );
  }
}
