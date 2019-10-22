import 'dart:ui' as ui;

double widthP(double percentage) {
  if (percentage <= 0) throw (Exception("percentage should be postive value"));
  return percentage *
      ui.window.physicalSize.width /
      (100.0 * ui.window.devicePixelRatio);
}

double heightP(double percentage) {
  if (percentage <= 0) throw (Exception("percentage should be postive value"));
  return percentage *
      ui.window.physicalSize.height /
      (100.0 * ui.window.devicePixelRatio);
}
