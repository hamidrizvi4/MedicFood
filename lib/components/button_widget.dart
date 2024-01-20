import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_model.dart';
export 'button_model.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late ButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FlutterFlowIconButton(
          borderRadius: 30.0,
          buttonSize: 40.0,
          fillColor: FlutterFlowTheme.of(context).primaryBackground,
          icon: Icon(
            Icons.brightness_4_rounded,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        FlutterFlowIconButton(
          borderRadius: 30.0,
          buttonSize: 40.0,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          icon: Icon(
            Icons.brightness_7_rounded,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
      ],
    );
  }
}
