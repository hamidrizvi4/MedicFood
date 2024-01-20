import '/components/main_logo/main_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phuuto_model.dart';
export 'phuuto_model.dart';

class PhuutoWidget extends StatefulWidget {
  const PhuutoWidget({Key? key}) : super(key: key);

  @override
  _PhuutoWidgetState createState() => _PhuutoWidgetState();
}

class _PhuutoWidgetState extends State<PhuutoWidget> {
  late PhuutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhuutoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: FlutterFlowTheme.of(context).primary,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                width: 60.0,
                height: 60.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/UI_avatar_2@3x.png',
                ),
              ),
            ),
          ),
          wrapWithModel(
            model: _model.mainLogoModel,
            updateCallback: () => setState(() {}),
            child: MainLogoWidget(),
          ),
        ],
      ),
    );
  }
}
