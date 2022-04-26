import 'package:express_delivery/app/constants/custom_shadows.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/custom_text_styles.dart';

class WarehouseTile extends StatelessWidget {
  final String title;
  final String address;
  final VoidCallback onTap;

  WarehouseTile({
    Key? key,
    required this.title,
    required this.address,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: CustomShadows.primaryShadow(),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.warehouse,
                          size: 24,
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 0.5,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: CustomTextStyles.zeplin8pt().copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6.0),
                        child: Text(
                          'Address: $address',
                          maxLines: 2,
                          style: CustomTextStyles.zeplin7pt().copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
