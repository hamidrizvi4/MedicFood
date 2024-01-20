import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'photo_model.dart';
export 'photo_model.dart';

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({Key? key}) : super(key: key);

  @override
  _PhotoWidgetState createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  late PhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FlutterFlowExpandedImageView(
                image: Image.asset(
                  'assets/images/0408fecb-4d79-4a74-b7fd-b61c6aafef7a.jpeg',
                  fit: BoxFit.contain,
                ),
                allowRotation: false,
                tag: 'lightModeTag',
                useHeroAnimation: true,
              ),
            ),
          );
        },
        child: Hero(
          tag: 'lightModeTag',
          transitionOnUserGestures: true,
          child: Image.asset(
            'assets/images/0408fecb-4d79-4a74-b7fd-b61c6aafef7a.jpeg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
