class Message {
  final int id;
  final String text;
  final bool received;
  final String timeStamp;

  Message(
      {required this.id,
      required this.text,
      required this.received,
      required this.timeStamp});
}

List<Message> messages = [
  Message(id: 0, received: false, text: " Hi Iam Vijay Bala", timeStamp: '4:30 PM'),
  Message(id: 1, received: true, text: "Yes, Iam Vijay Bala Too", timeStamp: '4:31 PM'),
  Message(id: 2, received: false, text: "Ooo Nice to meet you.", timeStamp: '4:32 PM'),
  Message(id: 3, received: true, text: "Thanks, ", timeStamp: '4:33 PM'),
  Message(id: 4, received: false, text: "I wanted", timeStamp: '4:33 PM'),
  Message(id: 5, received: true, text: " I agree", timeStamp: '4:33 PM'),
  Message(id: 6, received: false, text: "Sure. I think", timeStamp: '4:34 PM'),
];
