class Message {
  String _author;
  String _text;
  DateTime _dateTime;

  Message(this._author, this._text, this._dateTime);

  String get author => _author;
  String get text => _text;
  DateTime get dateTime => _dateTime;
}
