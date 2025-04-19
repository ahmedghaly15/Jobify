import 'package:logger/logger.dart';

enum ColorfulLogPrinterColor { green, pink, white }

class ColorfulPrinter extends LogPrinter {
  final ColorfulLogPrinterColor type;

  ColorfulPrinter({this.type = ColorfulLogPrinterColor.green});

  @override
  List<String> log(LogEvent event) {
    const resetColor = '\x1B[0m';
    final color = switch (type) {
      ColorfulLogPrinterColor.green => '\x1B[32m', // ANSI code for green
      ColorfulLogPrinterColor.pink => '\x1B[35m', // ANSI code for pink/magenta
      ColorfulLogPrinterColor.white => '\x1B[37m', // ANSI code for white
    };

    return [color + event.message.toString() + resetColor];
  }
}
