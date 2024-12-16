import 'package:edugated/features/scan/scan_state.dart';
import 'package:edugated/resources/utils.dart';
import 'package:edugated/widget/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'scan_cubit.dart';

class ScanPage extends StatefulWidget {
  final ScanCubit cubit;

  const ScanPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanState();
}

class _ScanState extends State<ScanPage> {
  ScanCubit get cubit => widget.cubit;

  @override
  void initState() {
    cubit.navigator.context = context;
    cubit.scanController = MobileScannerController(
      facing: CameraFacing.back,
      detectionSpeed: DetectionSpeed.noDuplicates,
      returnImage: true,
    );
    super.initState();
  }
  @override
  void dispose() {
    cubit.scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Content(data: "Scan Pass", size: 24.h, weight: FontWeight.w600,
              ),
        ),
        body: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              final scanState = state as ScanState;
              return Stack(
                children: [
                  MobileScanner(
                      controller: cubit.scanController,
                      onDetect: (capture) => cubit.onQrDetection(capture)),
                  scanState.isLoading ? Utils.showLoading(context) : SizedBox()
                ],
              );
            }));
  }
}
