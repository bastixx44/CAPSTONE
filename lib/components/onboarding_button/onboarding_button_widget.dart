import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_button_model.dart';
export 'onboarding_button_model.dart';

class OnboardingButtonWidget extends StatefulWidget {
  const OnboardingButtonWidget({super.key});

  @override
  State<OnboardingButtonWidget> createState() => _OnboardingButtonWidgetState();
}

class _OnboardingButtonWidgetState extends State<OnboardingButtonWidget> {
  late OnboardingButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingButtonModel());

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
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).brand1,
              FlutterFlowTheme.of(context).brand2
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(1.0, -0.14),
            end: AlignmentDirectional(-1.0, 0.14),
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.chevron_right,
          color: Colors.white,
          size: 24.0,
        ),
      ),
    );
  }
}
