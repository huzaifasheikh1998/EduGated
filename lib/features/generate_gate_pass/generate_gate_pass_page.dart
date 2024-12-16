import 'package:edugated/domain/entities/generate_gate_pass.dart';
import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/features/add_contact/add_contact_initial_params.dart';
import 'package:edugated/features/contact/contact_initial_params.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/resources/utils.dart';
import 'package:edugated/widget/content.dart';
import 'package:edugated/widget/content_field.dart';
import 'package:edugated/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'generate_gate_pass_cubit.dart';
import 'generate_gate_pass_state.dart';

class GenerateGatePassPage extends StatefulWidget {
  final GenerateGatePassCubit cubit;

  const GenerateGatePassPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<GenerateGatePassPage> createState() => _GenerateGatePassState();
}

class _GenerateGatePassState extends State<GenerateGatePassPage> {
  GenerateGatePassCubit get cubit => widget.cubit;

  @override
  void initState() {
    cubit.navigator.context = context;
    cubit.datePickerService.context = context;
    cubit.context = context;
    cubit.dateController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Content(
          data: "Generate Pass",
          size: 24.h,
          weight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(children: [
                  Image.asset(
                    AppAssets.logo,
                    height: 100.h,
                  ),
                ])),
            BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  final generateGatePassState = state as GenerateGatePassState;
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
                    margin: EdgeInsets.symmetric(horizontal: 20.r),
                    decoration: BoxDecoration(
                        color: AppColors.primaryShadeLight,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Form(
                      // key: addFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Content(
                              data: "Date",
                              size: 22.r,
                              color: AppColors.primaryColorDark,
                              weight: FontWeight.w700),
                          ContentField(
                            readOnly: true,
                            controller: cubit.dateController,
                            hintText: "Select Date",
                            ontap: () async => await cubit.onTapDate(),
                          ),
                          15.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Contact",
                                style: TextStyle(
                                    color: AppColors.primaryColorDark,
                                    fontSize: 22.r,
                                    fontWeight: FontWeight.w700),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cubit.onTapAddContact(
                                      const AddContactInitialParams());
                                  // addContactAlert(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColorDark,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          10.verticalSpace,
                          Container(
                            height: 0.4.sh,
                            decoration: BoxDecoration(
                                color: AppColors.primaryShadeLight
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: generateGatePassState.error != null
                                ? Center(
                                    child: Content(
                                      data: generateGatePassState.error!,
                                      size: 19.r,
                                      color: Colors.red,
                                    ),
                                  )
                                : generateGatePassState.isLoading
                                    ? Utils.showLoading(context)
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: generateGatePassState
                                            .contacts.length,
                                        itemBuilder: (context, index) {
                                          final iteration =
                                              generateGatePassState
                                                  .contacts[index];
                                          return Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.r)),
                                            child: ListTile(
                                              onTap: () => cubit
                                                  .onTapContact(iteration.id),
                                              onLongPress: () =>
                                                  cubit.onLongPressContact(
                                                      ContactInitialParams(
                                                          contact: iteration)),
                                              dense: true,
                                              tileColor: generateGatePassState
                                                          .contactId ==
                                                      iteration.id
                                                  ? AppColors.primaryColorDark
                                                  : AppColors.navBarColor,
                                              title: Content(
                                                data: iteration.name,
                                                size: 19.h,
                                                color: generateGatePassState
                                                            .contactId ==
                                                        iteration.id
                                                    ? AppColors.white
                                                    : null,
                                              ),
                                              subtitle: Content(
                                                data: iteration.phone,
                                                size: 17.h,
                                                color: generateGatePassState
                                                            .contactId ==
                                                        iteration.id
                                                    ? AppColors.white
                                                    : null,
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            15.verticalSpace,
                                      ),
                          ),
                          15.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PrimaryButton(
                                  width: 200,
                                  loading: state.isgenerateLoading,
                                  title: 'Generate',
                                  onTap: () async => cubit.onTapGenerate(
                                      GenerateGatePass(
                                          user_idd ?? "0",
                                          generateGatePassState.contactId ?? "",
                                          cubit.dateController.text))),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
