import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    'Software Boutique',
                    style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    '''There is an abundance of software available for Ubuntu MATE and some people find that choice overwhelming.
The Boutique is a carefully curated selection of the best-in-class applications chosen because they integrate well, 
complement Ubuntu MATE and enable you to self style your computing experience.''',
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "If you can't find what you're looking for, install one of the software centers to explore the complete Ubuntu software catalog.",
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
