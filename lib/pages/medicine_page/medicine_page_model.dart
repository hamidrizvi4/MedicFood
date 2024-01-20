import '/backend/backend.dart';
import '/components/main_logo/main_logo_widget.dart';
import '/components/meddetails/meddetails_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'medicine_page_widget.dart' show MedicinePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicinePageModel extends FlutterFlowModel<MedicinePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for main_Logo component.
  late MainLogoModel mainLogoModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainLogoModel = createModel(context, () => MainLogoModel());
  }

  void dispose() {
    mainLogoModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
