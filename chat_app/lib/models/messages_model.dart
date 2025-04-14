class MessagesModel {
  final String msg;
  final String id;
  MessagesModel(this.msg, this.id);

  factory MessagesModel.fromJson(jsonData) {
    return MessagesModel(jsonData['msg'], jsonData['id']);
  }
}
