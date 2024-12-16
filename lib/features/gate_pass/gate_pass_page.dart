import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'gate_pass_cubit.dart';

class GatePassPage extends StatefulWidget {
  final GatePassCubit cubit;

  const GatePassPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<GatePassPage> createState() => _GatePassState();
}

class _GatePassState extends State<GatePassPage> {
  GatePassCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Content(
            data: "My Pass",
            size: 22.h,
            weight: FontWeight.w600,
          ),
        ),
        body: SafeArea(
            child: Center(
                child: Center(
          child: Container(
            width: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    // margin: EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColorLight,
                        borderRadius: BorderRadius.circular(30)),
                    child: PrettyQrView(
                      qrImage: QrImage(
                          QrCode.fromData(data: user_qr??"EduGated", errorCorrectLevel: 1)),
                      decoration: const PrettyQrDecoration(
                          shape: PrettyQrSmoothSymbol(
                              color: AppColors.primaryColorDark,
                              roundFactor: 1)),
                    )
                    //  PrettyQr(
                    //   elementColor: AppColors.primaryColorDark,
                    //   // image: AssetImage(logo),
                    //   size: 200,
                    //   data: "attendeesQr",
                    //   roundEdges: true,
                    // ),
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 240,
                        margin: EdgeInsets.only(top: 20, bottom: 40),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColorDark,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(
                          user_name ?? "EduGated",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white),
                        ))),
                  ],
                ),
              ],
            ),
          ),
        ))));
  }
}
