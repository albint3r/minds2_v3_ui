import "dart:io";

import "package:bloc/bloc.dart";
import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:injectable/injectable.dart";
import "package:l/l.dart";
import "package:minds2_ui_v3/core/domain/custom_types.dart";
import "package:minds2_ui_v3/core/presentation/design_system/atoms/ds_text.dart";

const _unExpectedError = "Whoops! Unexpected Error happened.";
const _unExpectedRequestError = "$_unExpectedError with your request.";
const _unExpectedWebSocketError = "$_unExpectedError with WebSocket Connection";

@injectable
class AppBlocObserver extends BlocObserver {
  AppBlocObserver(@factoryParam this._messenger);

  final GlobalKey<ScaffoldMessengerState>? _messenger;

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    l.e("${bloc.runtimeType}: $error", stackTrace);

    /// Extract the error message if exit to display in app snackBar.
    /// This only work in the debug mode.
    final message = _extractErrorMessage(error);
    // Log the error in crashlytics
    final state = _messenger?.currentState;
    final context = _messenger?.currentContext;
    if (state is ScaffoldMessengerState && context is BuildContext) {
      final theme = Theme.of(context);
      state
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: DSText.labels(message ?? _unExpectedError),
            backgroundColor: theme.colorScheme.error,
          ),
        );
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    l.d(transition);
  }

  /// Extract the error message to display in the Log Terminal.
  String? _extractErrorMessage(Object error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.badResponse) {
        final data = error.response!.data;
        if (data is Json) {
          return (data["message"] as String?) ?? _unExpectedRequestError;
        }
        return _unExpectedRequestError;
      }
      if (error.error is SocketException) return _unExpectedWebSocketError;
    }
    if (error is AssertionError) {
      return error.message.toString();
    }
    // if (error is SendCampaignSingleContactError) {
    //   return error.message;
    // }
    // if (error is ContactCampaignCreationError) {
    //   return error.message;
    // }
    // if (error is ContactAlreadyExistInCampingError) {
    //   return error.message;
    // }
    // if (error is ErrorBillingPayMentError) {
    //   return error.message;
    // }
    // if (error is FetchingCampaignsTemplatesError) {
    //   return error.message;
    // }
    // if (error is CreatingCampaignsTemplatesError) {
    //   return error.message;
    // }
    // if (error is DuplicateNameToolError) {
    //   return error.message;
    // }
    return null;
  }
}
