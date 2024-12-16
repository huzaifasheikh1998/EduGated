import 'package:edugated/data/rest_api_guest_repository.dart';
import 'package:edugated/data/insecure_local_storage_repository.dart';
import 'package:edugated/data/rest_api_activity_repository.dart';
import 'package:edugated/data/rest_api_add_contact_repository.dart';
import 'package:edugated/data/rest_api_contacts_repository.dart';
import 'package:edugated/data/rest_api_generate_gate_pass_repository.dart';
import 'package:edugated/data/rest_api_login_repository.dart';
import 'package:edugated/data/rest_api_scan_respository.dart';
import 'package:edugated/data/stagging_app_url.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/repositories/activity_repository.dart';
import 'package:edugated/domain/repositories/add_contact_repository.dart';
import 'package:edugated/domain/repositories/contacts.repository.dart';
import 'package:edugated/domain/repositories/generate_gate_pass_repository.dart';
import 'package:edugated/domain/repositories/guest_repository.dart';
import 'package:edugated/domain/repositories/local_storage_repository.dart';
import 'package:edugated/domain/repositories/login_repository.dart';
import 'package:edugated/domain/repositories/scan_repository.dart';
import 'package:edugated/domain/stores/user_store.dart';
import 'package:edugated/domain/use_cases/add_contact_use_case.dart';
import 'package:edugated/domain/use_cases/generate_gate_pass_use_case.dart';
import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/domain/use_cases/scan_use_case.dart';
import 'package:edugated/domain/validator/add_contact_validator.dart';
import 'package:edugated/domain/validator/generate_gate_pass_validator.dart';
import 'package:edugated/domain/validator/login_validator.dart';
import 'package:edugated/features/activity/activity_cubit.dart';
import 'package:edugated/features/activity/activity_initial_params.dart';
import 'package:edugated/features/activity/activity_navigator.dart';
import 'package:edugated/features/add_contact/add_contact_cubit.dart';
import 'package:edugated/features/add_contact/add_contact_initial_params.dart';
import 'package:edugated/features/contact/contact_cubit.dart';
import 'package:edugated/features/contact/contact_initial_params.dart';
import 'package:edugated/features/contact/contact_navigator.dart';
import 'package:edugated/features/gate_pass/gate_pass_cubit.dart';
import 'package:edugated/features/gate_pass/gate_pass_initial_params.dart';
import 'package:edugated/features/gate_pass/gate_pass_navigator.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_cubit.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_initial_params.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_navigator.dart';
import 'package:edugated/features/guest/guest_cubit.dart';
import 'package:edugated/features/guest/guest_initial_params.dart';
import 'package:edugated/features/guest/guest_navigator.dart';
import 'package:edugated/features/guest_pass/guest_pass_cubit.dart';
import 'package:edugated/features/guest_pass/guest_pass_initial_params.dart';
import 'package:edugated/features/guest_pass/guest_pass_navigator.dart';
import 'package:edugated/features/home/home_cubit.dart';
import 'package:edugated/features/home/home_initial_params.dart';
import 'package:edugated/features/home/home_navigator.dart';
import 'package:edugated/features/login/login_cubit.dart';
import 'package:edugated/features/login/login_initial_params.dart';
import 'package:edugated/features/login/login_navigator.dart';
import 'package:edugated/features/pass_detail/pass_detail_cubit.dart';
import 'package:edugated/features/pass_detail/pass_detail_initial_params.dart';
import 'package:edugated/features/pass_detail/pass_detail_navigator.dart';
import 'package:edugated/features/profile/profile_cubit.dart';
import 'package:edugated/features/profile/profile_initial_params.dart';
import 'package:edugated/features/profile/profile_navigator.dart';
import 'package:edugated/features/scan/scan_cubit.dart';
import 'package:edugated/features/scan/scan_initial_params.dart';
import 'package:edugated/features/scan/scan_navigator.dart';
import 'package:edugated/features/selection/selection_cubit.dart';
import 'package:edugated/features/selection/selection_initial_params.dart';
import 'package:edugated/features/selection/selection_navigator.dart';
import 'package:edugated/features/selection/selection_page.dart';
import 'package:edugated/navigation/app_navigator.dart';
import 'package:edugated/navigation/navigation.dart';
import 'package:edugated/network/network.dart';
import 'package:edugated/network/network_repository.dart';
import 'package:edugated/resources/validator.dart';
import 'package:edugated/services/date_picker_service.dart';
import 'package:edugated/services/pick_image_service.dart';
import 'package:edugated/services/scan_service.dart';
import 'package:edugated/services/screen_capture.dart';
import 'package:edugated/services/share_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  getIt.registerSingleton<Validator>(Validator());
  getIt.registerSingleton<AppUrl>(StaggingAppUrl());
  getIt.registerSingleton<Network>(NetworkRepository());
  getIt.registerSingleton<Navigation>(AppNavigator());

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Store >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  getIt.registerSingleton<UserStore>(UserStore());

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Services >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  getIt.registerSingleton<PickImageService>(PickImageService());
  getIt.registerSingleton<DatePickerService>(DatePickerService());
  getIt.registerSingleton<ScreenCapture>(ScreenCapture());
  getIt.registerSingleton<ShareFile>(ShareFile());
  getIt.registerSingleton<ScanService>(ScanService());

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Repository >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<LocalStorageRepository>(
      InsecureLocalStorageRepository());
  getIt.registerSingleton<ActivityRepository>(
      RestApiActivityRepository(getIt(), getIt()));
  getIt.registerSingleton<ContactsRepository>(
      RestApiContactsRepository(getIt(), getIt()));
  getIt.registerSingleton<GenerateGatePassRepository>(
      RestApiGenerateGatePassRepository(getIt(), getIt()));
  getIt.registerSingleton<GuestRepository>(
      RestApiGuestRepository(getIt(), getIt()));
  getIt.registerSingleton<LoginRepository>(
      RestApiLoginRespository(getIt(), getIt()));
  getIt.registerSingleton<ScanRepository>(
      RestApiScanRepository(getIt(), getIt()));

  // getIt.registerSingleton<ContactsRepository>(MockContactsRepository());
  getIt.registerSingleton<AddContactRepository>(
      RestApiAddContactRepository(getIt(), getIt()));

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< validation >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  getIt.registerSingleton<AddContactValidator>(AddContactValidator(getIt()));
  getIt.registerSingleton<GenerateGatePassValidator>(
      GenerateGatePassValidator(getIt()));
  getIt.registerSingleton<LoginValidator>(LoginValidator(getIt()));

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Navigation >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  getIt.registerSingleton<ActivityNavigator>(ActivityNavigator(getIt()));
  getIt.registerSingleton<HomeNavigator>(HomeNavigator());
  getIt.registerSingleton<GatePassNavigator>(GatePassNavigator());
  getIt.registerSingleton<GuestNavigator>(GuestNavigator(getIt()));
  getIt.registerSingleton<GenerateGatePassNavigator>(
      GenerateGatePassNavigator(getIt()));
  getIt.registerSingleton<GuestPassNavigator>(GuestPassNavigator());
  getIt.registerSingleton<ProfileNavigator>(ProfileNavigator(getIt()));
  getIt.registerSingleton<SelectionNavigator>(SelectionNavigator(getIt()));
  getIt.registerSingleton<LoginNavigator>(LoginNavigator(getIt()));
  getIt.registerSingleton<ScanNavigator>(ScanNavigator(getIt()));
  getIt.registerSingleton<PassDetailNavigator>(PassDetailNavigator());

  getIt.registerSingleton<ContactNavigator>(ContactNavigator());

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Use Case >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  getIt.registerSingleton<AddContactUseCase>(AddContactUseCase(
    getIt(),
    getIt(),
  ));
  getIt.registerSingleton<GenerateGatePassUseCase>(GenerateGatePassUseCase(
    getIt(),
    getIt(),
  ));
  getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt(), getIt(), getIt(), getIt()));
  getIt.registerSingleton<ScanUseCase>(ScanUseCase(getIt(), getIt()));

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Cubit >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  getIt.registerFactoryParam<ActivityCubit, ActivityInitialParams, dynamic>(
      (params, _) =>
          ActivityCubit(params, getIt(), getIt(), getIt())..fetchActivity());
  getIt.registerFactoryParam<HomeCubit, HomeInitialParams, dynamic>(
      (params, _) => HomeCubit(params, getIt(), getIt()));
  getIt.registerFactoryParam<GuestCubit, GuestInitialParams, dynamic>(
      (params, _) => GuestCubit(params, getIt(), getIt())..fetchGuestPass());
  getIt.registerFactoryParam<GatePassCubit, GatePassInitialParams, dynamic>(
      (params, _) => GatePassCubit(params, getIt()));
  getIt.registerFactoryParam<GenerateGatePassCubit,
          GenerateGatePassInitialParams, dynamic>(
      (params, _) =>
          GenerateGatePassCubit(params, getIt(), getIt(), getIt(), getIt())
            ..fetchContacts());
  getIt.registerFactoryParam<AddContactCubit, AddContactInitialParams, dynamic>(
      (param, _) => AddContactCubit(param, getIt(), getIt()));
  getIt.registerFactoryParam<GuestPassCubit, GuestPassInitialParams, dynamic>(
      (param, _) => GuestPassCubit(param, getIt(), getIt()));
  getIt.registerFactoryParam<ProfileCubit, ProfileInitialParams, dynamic>(
      (param, _) => ProfileCubit(param, getIt(), getIt()));
  getIt.registerFactoryParam<SelectionCubit, SelectionInitialParams, dynamic>(
      (param, _) => SelectionCubit(param, getIt()));

  getIt.registerFactoryParam<LoginCubit, LoginInitialParams, dynamic>(
      (param, _) => LoginCubit(param, getIt(), getIt()));
  getIt.registerFactoryParam<ScanCubit, ScanInitialParams, dynamic>(
      (param, _) => ScanCubit(param, getIt(), getIt()));
  getIt.registerFactoryParam<PassDetailCubit, PassDetailInitialParams, dynamic>(
      (param, _) => PassDetailCubit(param));
  getIt.registerFactoryParam<ContactCubit, ContactInitialParams, dynamic>(
      (param, _) => ContactCubit(param));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: GoogleFonts.nunito().fontFamily),
              home: SelectionPage(
                  cubit: getIt(param1: const SelectionInitialParams()))
              // HomePage(cubit: getIt(param1: const HomeInitialParams()))
              );
        });
  }
}
