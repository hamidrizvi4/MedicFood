import '/components/main_logo/main_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'phuuto_widget.dart' show PhuutoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhuutoModel extends FlutterFlowModel<PhuutoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for main_Logo component.
  late MainLogoModel mainLogoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainLogoModel = createModel(context, () => MainLogoModel());
  }

  void dispose() {
    mainLogoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
