/*
class getAllChats {
  List<TicketData>? ticketData;
  String? code;

  getAllChats({this.ticketData, this.code});

  getAllChats.fromJson(Map<String, dynamic> json) {
    if (json['ticketData'] != null) {
      ticketData = <TicketData>[];
      json['ticketData'].forEach((v) {
        ticketData!.add(new TicketData.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ticketData != null) {
      data['ticketData'] = this.ticketData!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class TicketData {
  String? sId;
  String? clientId;
  String? subject;
  String? openAt;
  String? status;
  List<Conversations>? conversations;
  int? iV;

  TicketData(
      {this.sId,
        this.clientId,
        this.subject,
        this.openAt,
        this.status,
        this.conversations,
        this.iV});

  TicketData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clientId = json['clientId'];
    subject = json['subject'];
    openAt = json['openAt'];
    status = json['status'];
    if (json['conversations'] != null) {
      conversations = <Conversations>[];
      json['conversations'].forEach((v) {
        conversations!.add(new Conversations.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['clientId'] = this.clientId;
    data['subject'] = this.subject;
    data['openAt'] = this.openAt;
    data['status'] = this.status;
    if (this.conversations != null) {
      data['conversations'] =
          this.conversations!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Conversations {
  String? sender;
  String? message;
  String? msgAt;
  String? sId;

  Conversations({this.sender, this.message, this.msgAt, this.sId});

  Conversations.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    message = json['message'];
    msgAt = json['msgAt'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['message'] = this.message;
    data['msgAt'] = this.msgAt;
    data['_id'] = this.sId;
    return data;
  }
}*/




class GetAllChats {
  List<TicketData>? ticketData;
  String? code;

  GetAllChats({this.ticketData, this.code});

  GetAllChats.fromJson(Map<String, dynamic> json) {
    if (json['ticketData'] != null) {
      ticketData = <TicketData>[];
      json['ticketData'].forEach((v) {
        ticketData!.add(new TicketData.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ticketData != null) {
      data['ticketData'] = this.ticketData!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class TicketData {
  String? sId;
  String? clientId;
  String? subject;
  String? openAt;
  String? status;
  List<Conversations>? conversations;
  int? iV;

  TicketData(
      {this.sId,
        this.clientId,
        this.subject,
        this.openAt,
        this.status,
        this.conversations,
        this.iV});

  TicketData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clientId = json['clientId'];
    subject = json['subject'];
    openAt = json['openAt'];
    status = json['status'];
    if (json['conversations'] != null) {
      conversations = <Conversations>[];
      json['conversations'].forEach((v) {
        conversations!.add(new Conversations.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['clientId'] = this.clientId;
    data['subject'] = this.subject;
    data['openAt'] = this.openAt;
    data['status'] = this.status;
    if (this.conversations != null) {
      data['conversations'] =
          this.conversations!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Conversations {
  String? sender;
  String? message;
  String? msgAt;
  String? sId;

  Conversations({this.sender, this.message, this.msgAt, this.sId});

  Conversations.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    message = json['message'];
    msgAt = json['msgAt'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['message'] = this.message;
    data['msgAt'] = this.msgAt;
    data['_id'] = this.sId;
    return data;
  }
}



