import 'package:first_app/widgets/images.dart';
import 'package:flutter/material.dart';
import '../resources/resources.dart';

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({super.key});

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(image: AssetImage(MyImagesPaths.kit2)),
    );
  }
}
