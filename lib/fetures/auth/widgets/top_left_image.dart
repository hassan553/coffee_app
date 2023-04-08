import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/widget/custom_image.dart';

class TopLeftImage extends StatelessWidget {
  const TopLeftImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: CustomAssetsImage(
          path: 'assets/coffee.png', width: 200, boxFit: BoxFit.fill),
    );
  }
}
