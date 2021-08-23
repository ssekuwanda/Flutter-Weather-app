class DescriptionInfo {
  final String? description;
  final String? icon;

  DescriptionInfo({this.description, this.icon});
  factory DescriptionInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return DescriptionInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double? temperature;

  TemperatureInfo({this.temperature});
  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String? cityName;
  final TemperatureInfo tempInfo;
  final DescriptionInfo descInfo;

  WeatherResponse(this.cityName, this.tempInfo, this.descInfo);

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final descriptionInfoJson = json['weather'][0];
    final descInfo = DescriptionInfo.fromJson(descriptionInfoJson);

    return WeatherResponse(cityName, tempInfo, descInfo);
  }
}
