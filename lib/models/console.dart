class Console {
  String output = "";

  String getLog() {
    return output;
  }

  void addLog(String fmt) {
    output += fmt;
    output += "\n";
  }
}
