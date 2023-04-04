import 'package:flutter/material.dart';
import 'package:password_manager/src/config/colors.dart';
import 'package:password_manager/src/feature/passwords/widgets/password_details.dart';
import 'package:password_manager/src/utils/extensions/context.dart';

import '../../../config/constants.dart';
import '../../../utils/modals/modals.dart';

class PasswordCard extends StatelessWidget {
  const PasswordCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modals.showModal(context, child: const PasswordDetailsWidget()),
      child: Container(
        padding: AppConstants.fullEdgeInsets,
        margin: const EdgeInsets.only(bottom: 5), //TODO constant
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LICHI", style: context.theme.textTheme.displayLarge,),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.copy_sharp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
