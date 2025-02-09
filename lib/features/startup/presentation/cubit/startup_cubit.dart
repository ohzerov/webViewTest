import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zmtest/core/di/di.dart';
import 'package:zmtest/features/startup/domain/repository/startup_repository.dart';
import 'package:zmtest/features/startup/presentation/cubit/startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  final StartupRepository startupRepository = StartupRepository();
  StartupCubit() : super(StartupInitial());

  Future<void> checkLink() async {
    emit(StartupLoading());
    try {
      String? url = _getUrl();

      if (url != null) {
        await Future.delayed(Duration(milliseconds: 1500), () {
          emit(StartupSuccess());
        });
      } else {
        await startupRepository.fetchLink();
        url = _getUrl();
        if (url != null) {
          await Future.delayed(Duration(milliseconds: 1500), () {
            emit(StartupSuccess());
          });
        } else {
          await Future.delayed(Duration(milliseconds: 1500), () {
            emit(StartupFailure());
          });
        }
      }
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 1500), () {
        emit(StartupFailure());
      });
    }
  }

  String? _getUrl() => getIt<SharedPreferences>().getString('url');
}
