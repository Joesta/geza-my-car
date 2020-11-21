
class Service {
  List<String> _serviceList;
  String _serviceType;
  String _status;

  Service(String serviceType, String status, List<String> serviceList) {
    _serviceType = serviceType;
    _serviceList = serviceList;
    _status = status;
  }


  String get status => _status;

  set status(String value) {
    _status = value;
  }

  List<String> get serviceList => _serviceList;

  set serviceList(List<String> value) {
    _serviceList = value;
  }

  String get serviceType => _serviceType;

  set serviceType(String value) {
    _serviceType = value;
  }

  Map<String, Object> toJson() {
    return {
      'services': serviceList,
      'serviceType': serviceType,
      'status': status
    };
  }
}