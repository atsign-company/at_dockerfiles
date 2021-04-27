import 'dart:io';
import 'dart:convert';

void main() {
  var lscpu = Process.runSync('lscpu',[]).stdout;
  LineSplitter ls = new LineSplitter();
  final lines = ls.convert(lscpu);
  final model = lines.firstWhere((line) => line.startsWith('Architecture'));
  print(model.split(':').last.trim());
}
