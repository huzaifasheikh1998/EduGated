import 'package:flutter_bloc/flutter_bloc.dart';
import 'pass_detail_initial_params.dart';
import 'pass_detail_state.dart';

class PassDetailCubit extends Cubit<PassDetailState> {
  final PassDetailInitialParams initialParams;

  PassDetailCubit(this.initialParams)
      : super(PassDetailState.initial(initialParams: initialParams));
}
