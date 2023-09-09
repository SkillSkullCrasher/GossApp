import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gosapp/common/utils/widgets/custom_icon_button.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Select contact',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            '5 contacts',
            style: TextStyle(fontSize: 12),
          ),
        ]),
        actions: [
          CustomIconButton(onTap: () {}, icon: Icons.search),
          CustomIconButton(onTap: () {}, icon: Icons.more_vert),
        ],
      ),
    );
  }
}
