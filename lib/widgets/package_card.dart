import 'dart:io';

import 'package:flutter/material.dart';
import 'package:softwareboutique/model/package.dart';
import 'package:html/parser.dart';

class PackageCard extends StatelessWidget {
  const PackageCard(this.package, {Key? key}) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //ListTile(
        //  leading: SizedBox(width: 96, child: Image.file(File('assets/img/applications/${package.img}.png'))),
        //  title: Text(package.name),
        //  contentPadding: EdgeInsets.zero,
        //  subtitle: Padding(
        //    padding: const EdgeInsets.only(top: 16),
        //    child: Text(
        //      parse(package.description).documentElement!.text,
        //      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w100),
        //    ),
        //  ),
        //),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Image.file(File('assets/img/applications/${package.img}.png')),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(package.name),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      parse(package.description).documentElement!.text,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w100),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: () {}, child: const Text('Details')),
                      const SizedBox(width: 8),
                      ElevatedButton(onPressed: () {}, child: const Text('Install')),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        const Divider(
          height: 32,
        ),
      ],
    );
  }
}
