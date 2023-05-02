import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:password_manager/src/config/constants/ui_constants.dart';
import 'package:password_manager/src/utils/extensions/context.dart';

import '../../utils/haptics.dart';

class QrPage extends StatelessWidget {
  QrPage({Key? key, required this.parentContext}) : super(key: key);

  final BuildContext parentContext;
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            MobileScanner(
                controller: controller,
                onDetect:
                    (Barcode barcode, MobileScannerArguments? args) async {
                  AppHaptics.buttonPress();
                }),
            ClipPath(
              clipper: BarcodeClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor.withOpacity(0.9),
                ),
              ),
            ),
            Positioned(
                top: context.heightPx / 2 + 180,
                left: context.widthPx / 2 - 125, // 250 / 2
                child: SizedBox(
                  //                         ^
                  width: 250, //-------------|
                  child: Text(
                    'Отсканируйте QR код на компьютере',
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.displayMedium,
                  ),
                )),
            SafeArea(
              minimum: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () => context.router.pop(),
                child: Padding(
                  padding: UiConstants.fullEdgeInsets,
                  child: Icon(Icons.close),
                ),
              )


              // CustomIconButton(
              //     color: context.theme.primaryColor.withOpacity(.5),
              //     iconSize: AppConstants.bigIconSize,
              //     icon: LichiIcons.cross2,
              //     onPressed: () => Modals.closeModal()),
            )
          ],
        ));
  }
}

class BarcodeClipper extends CustomClipper<Path> {
  double barcodeWidth = 300;
  double barcodeHeight = 300;

  @override
  Path getClip(Size size) {
    // return Path()
    //   ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
    //   ..fillType = PathFillType.evenOdd;
    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      Path()
        ..addRect(Rect.fromLTWH((size.width - barcodeWidth) / 2,
            (size.height - barcodeHeight) / 2, barcodeWidth, barcodeHeight))
        ..close(),
    );
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
    throw UnimplementedError();
  }
}
