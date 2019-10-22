class Reservation {

  String reservationDay, startsAt, endsAt;
  List<int> services = new List();

  Reservation({this.reservationDay, this.startsAt, this.endsAt, this.services});

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    reservationDay: json["reservationDay"],
    startsAt: json["startsAt"],
    endsAt: json["endsAt"],
    services: json["services"],
  );

  Map<String, dynamic> toJson() => {
    "reservationDay": reservationDay == null ? null : reservationDay,
    "startsAt": startsAt,
    "endsAt": endsAt,
    "services": services,
  };

}