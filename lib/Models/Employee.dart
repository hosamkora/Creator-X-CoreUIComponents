class Employee {
  int employeeId;
  String employeeName;
  String dayName;
  String dayDate;
  List<AvailableTimes> availableTimes;

  Employee(
      {this.employeeId,
      this.employeeName,
      this.dayName,
      this.dayDate,
      this.availableTimes});

  Employee.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    dayName = json['day_name'];
    dayDate = json['day_date'];
    if (json['available_times'] != null) {
      availableTimes = new List<AvailableTimes>();
      json['available_times'].forEach((v) {
        availableTimes.add(new AvailableTimes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['day_name'] = this.dayName;
    data['day_date'] = this.dayDate;
    if (this.availableTimes != null) {
      data['available_times'] =
          this.availableTimes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableTimes {
  String from;
  String to;

  AvailableTimes({this.from, this.to});

  AvailableTimes.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
