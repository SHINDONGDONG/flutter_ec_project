import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitle;

  const TopTitles({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Gap(kToolbarHeight + 12),
      if(title=='Login' || title=='Create Account')
        // const BackButton(),
        GestureDetector(
          onTap: ()=> Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        const Gap(12.0),
        // CupertinoButton(
        //   padding: EdgeInsets.zero,
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(
        //   Icons.arrow_back,
        //   size: 28.8,
        // )),
      Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Gap(12),
      Text(
        subtitle,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    ]);
  }
}
