import 'package:edugated/features/guest_pass/widget/guest_pass_tile.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'contact_cubit.dart';

class ContactPage extends StatefulWidget {
  final ContactCubit cubit;

  const ContactPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactState();
}

class _ContactState extends State<ContactPage> {
  ContactCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Content(data: "Contact Detail", size: 24.h,weight: FontWeight.w600,),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: AppColors.primaryColorLight,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                children: [
                  Container(
                      width: 200.h,
                      height: 200.h,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.network(cubit
                              .initialParams.contact?.cnicImage ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_we7r5CWAZRO7KN7WjBPMnjp4hDlLIrVGYad4FRuh2g&s")),
                  GuestPassTile(
                      title: "Name", value: cubit.initialParams.contact!.name),
                  GuestPassTile(
                      title: "Phone",
                      value: cubit.initialParams.contact!.phone),
                  GuestPassTile(
                      title: "Type", value: cubit.initialParams.contact!.type),
                ],
              ),
            )
          ],
        ));
  }
}
