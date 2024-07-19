import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../controllers/PdfViewController.dart';

class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('PDF View'),),
      body: GetBuilder<PdfViewController>(
        init: PdfViewController(),
        builder: (controller) =>
        SfPdfViewer.asset(
        enableDoubleTapZooming: true,
        controller.selectBook())
    )
    );
  }
}
