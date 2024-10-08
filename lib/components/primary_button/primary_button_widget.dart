import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'primary_button_model.dart';
export 'primary_button_model.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget({
    super.key,
    String? buttonText,
  }) : this.buttonText = buttonText ?? 'Primary';

  final String buttonText;

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  late PrimaryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 22.0,
              color: FlutterFlowTheme.of(context).blueShadow,
              offset: Offset(
                0.0,
                10.0,
              ),
            )
          ],
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).brand1,
              FlutterFlowTheme.of(context).brand2
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(1.0, -0.14),
            end: AlignmentDirectional(-1.0, 0.14),
          ),
          borderRadius: BorderRadius.circular(99.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 18.0),
              child: Text(
                widget!.buttonText,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
