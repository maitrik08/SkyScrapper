class ForcastModel {
  Location location = Location(name: '', region: '', country: '', lat: 0, lon: 0, tzId: '0', localtimeEpoch: 0, localtime: '');
  Current current = Current(lastUpdatedEpoch: 0, lastUpdated: '', tempC: 0, tempF: 0, isDay: 0, condition: Condition(text: '',icon: '',code: 0), windMph: 0, windKph: 0, windDegree: 0, windDir: '', pressureMb: 0, pressureIn: 0, precipMm: 0, precipIn: 0, humidity: 0, cloud: 0, feelslikeC: 0, feelslikeF: 0, visKm: 0, visMiles: 0, uv: 0, gustMph: 0, gustKph: 0);
  Forecast forecast = Forecast(forecastday: []);

  ForcastModel({required this.location,required this.current,required this.forecast});

  ForcastModel.fromJson(Map<String, dynamic> json) {
    location =  Location.fromJson(json['location']);
    current =   Current.fromJson(json['current']);
    forecast = Forecast.fromJson(json['forecast']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['location'] = this.location.toJson();
    data['current'] = this.current.toJson();
    data['forecast'] = this.forecast.toJson();
    return data;
  }
}

class Location {
  String name = '';
  String region = '';
  String country = '';
  double lat = 0;
  double lon = 0;
  String tzId = '';
  int localtimeEpoch = 0;
  String localtime = '';

  Location(
      {required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['tz_id'] = this.tzId;
    data['localtime_epoch'] = this.localtimeEpoch;
    data['localtime'] = this.localtime;
    return data;
  }
}

class Current {
  int lastUpdatedEpoch = 0;
  String lastUpdated = '';
  double tempC = 0;
  double tempF = 0;
  int isDay = 0;
  Condition condition = Condition(text: '', icon: '', code: 0);
  double windMph = 0;
  double windKph = 0;
  int windDegree = 0;
  String windDir = '';
  double pressureMb = 0;
  double pressureIn = 0;
  double precipMm = 0;
  double precipIn = 0;
  int humidity = 0;
  int cloud = 0;
  double feelslikeC = 0;
  double feelslikeF = 0;
  double visKm = 0;
  double visMiles = 0;
  double uv = 0;
  double gustMph = 0;
  double gustKph = 0;

  Current(
      {required this.lastUpdatedEpoch,
        required this.lastUpdated,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.visKm,
        required this.visMiles,
        required this.uv,
        required this.gustMph,
        required this.gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition =  Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['last_updated_epoch'] = this.lastUpdatedEpoch;
    data['last_updated'] = this.lastUpdated;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    data['is_day'] = this.isDay;
    data['condition'] = this.condition.toJson();
    data['wind_mph'] = this.windMph;
    data['wind_kph'] = this.windKph;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure_mb'] = this.pressureMb;
    data['pressure_in'] = this.pressureIn;
    data['precip_mm'] = this.precipMm;
    data['precip_in'] = this.precipIn;
    data['humidity'] = this.humidity;
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslikeC;
    data['feelslike_f'] = this.feelslikeF;
    data['vis_km'] = this.visKm;
    data['vis_miles'] = this.visMiles;
    data['uv'] = this.uv;
    data['gust_mph'] = this.gustMph;
    data['gust_kph'] = this.gustKph;
    return data;
  }
}

class Condition {
  String text = '';
  String icon = '';
  int code = 0;

  Condition({ required this.text,required this.icon,required this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}

class Forecast {
  List<Forecastday>  forecastday = [];

  Forecast({required this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    forecastday = <Forecastday>[];
    json['forecastday'].forEach((v) {
      forecastday.add(Forecastday.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
      data['forecastday'] = this.forecastday.map((v) => v.toJson()).toList();
    return data;
  }
}

class Forecastday {
  String date = '';
  int dateEpoch = 0;
  Day day = Day(maxtempC: 0, maxtempF: 0, mintempC: 0, mintempF: 0, avgtempC: 0, avgtempF: 0, maxwindMph: 0, maxwindKph: 0, totalprecipMm: 0, totalprecipIn: 0, totalsnowCm: 0, avgvisKm: 0, avgvisMiles: 0, avghumidity: 0, dailyWillItRain: 0, dailyChanceOfRain: 0, dailyWillItSnow: 0, dailyChanceOfSnow: 0, condition: Condition(text: '', icon: '', code: 0), uv: 0);
  Astro astro = Astro(sunrise: '', sunset: '', moonrise: '', moonset: '', moonPhase: '', moonIllumination: 0, isMoonUp: 0, isSunUp: 0);
  List<Hour> hour = [];

  Forecastday({required this.date,required  this.dateEpoch,required  this.day,required  this.astro,required this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = Day.fromJson(json['day']);
    astro =Astro.fromJson(json['astro']);
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour.add(new Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['date_epoch'] = this.dateEpoch;
    data['day'] = this.day.toJson();
    data['astro'] = this.astro.toJson();
      data['hour'] = this.hour.map((v) => v.toJson()).toList();
    return data;
  }
}

class Day {
  double maxtempC = 0;
  double maxtempF = 0;
  double mintempC = 0;
  double mintempF = 0;
  double avgtempC = 0;
  double avgtempF = 0;
  double maxwindMph = 0;
  double maxwindKph = 0;
  double totalprecipMm = 0;
  double totalprecipIn = 0;
  double totalsnowCm = 0;
  double avgvisKm = 0;
  double avgvisMiles = 0;
  double avghumidity = 0;
  int dailyWillItRain = 0;
  int dailyChanceOfRain = 0;
  int dailyWillItSnow = 0;
  int dailyChanceOfSnow = 0;
  Condition condition = Condition(text: '', icon: '', code: 0);
  double uv = 0;

  Day(
      {required this.maxtempC,
        required this.maxtempF,
        required this.mintempC,
        required this.mintempF,
        required this.avgtempC,
        required this.avgtempF,
        required this.maxwindMph,
        required this.maxwindKph,
        required this.totalprecipMm,
        required this.totalprecipIn,
        required this.totalsnowCm,
        required this.avgvisKm,
        required this.avgvisMiles,
        required this.avghumidity,
        required this.dailyWillItRain,
        required this.dailyChanceOfRain,
        required this.dailyWillItSnow,
        required this.dailyChanceOfSnow,
        required this.condition,
        required this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    totalsnowCm = json['totalsnow_cm'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = Condition.fromJson(json['condition']);
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxtemp_c'] = this.maxtempC;
    data['maxtemp_f'] = this.maxtempF;
    data['mintemp_c'] = this.mintempC;
    data['mintemp_f'] = this.mintempF;
    data['avgtemp_c'] = this.avgtempC;
    data['avgtemp_f'] = this.avgtempF;
    data['maxwind_mph'] = this.maxwindMph;
    data['maxwind_kph'] = this.maxwindKph;
    data['totalprecip_mm'] = this.totalprecipMm;
    data['totalprecip_in'] = this.totalprecipIn;
    data['totalsnow_cm'] = this.totalsnowCm;
    data['avgvis_km'] = this.avgvisKm;
    data['avgvis_miles'] = this.avgvisMiles;
    data['avghumidity'] = this.avghumidity;
    data['daily_will_it_rain'] = this.dailyWillItRain;
    data['daily_chance_of_rain'] = this.dailyChanceOfRain;
    data['daily_will_it_snow'] = this.dailyWillItSnow;
    data['daily_chance_of_snow'] = this.dailyChanceOfSnow;
    data['condition'] = this.condition.toJson();
    data['uv'] = this.uv;
    return data;
  }
}

class Astro {
  String sunrise = '';
  String sunset = '';
  String moonrise = '';
  String moonset = '';
  String moonPhase = '';
  int moonIllumination = 0;
  int isMoonUp = 0;
  int isSunUp = 0;

  Astro(
      {required this.sunrise,
        required this.sunset,
        required this.moonrise,
        required this.moonset,
        required this.moonPhase,
        required this.moonIllumination,
        required this.isMoonUp,
        required this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    data['moon_illumination'] = this.moonIllumination;
    data['is_moon_up'] = this.isMoonUp;
    data['is_sun_up'] = this.isSunUp;
    return data;
  }
}

class Hour {
  int timeEpoch = 0;
  String time = '';
  double tempC = 0;
  double tempF = 0;
  int isDay = 0;
  Condition condition = Condition(text: '', icon: '', code: 0);
  double windMph = 0;
  double windKph = 0;
  int windDegree = 0;
  String windDir = '';
  double pressureMb = 0;
  double pressureIn = 0;
  double precipMm = 0;
  double precipIn = 0;
  int humidity = 0;
  int cloud = 0;
  double feelslikeC = 0;
  double feelslikeF = 0;
  double windchillC = 0;
  double windchillF = 0;
  double heatindexC = 0;
  double heatindexF = 0;
  double dewpointC = 0;
  double dewpointF = 0;
  int willItRain = 0;
  int chanceOfRain = 0;
  int willItSnow = 0;
  int chanceOfSnow = 0;
  double visKm = 0;
  double visMiles = 0;
  double gustMph = 0;
  double gustKph = 0;
  double uv = 0;

  Hour(
      {required this.timeEpoch,
        required this.time,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.windchillC,
        required this.windchillF,
        required this.heatindexC,
        required this.heatindexF,
        required this.dewpointC,
        required this.dewpointF,
        required this.willItRain,
        required this.chanceOfRain,
        required this.willItSnow,
        required this.chanceOfSnow,
        required this.visKm,
        required this.visMiles,
        required this.gustMph,
        required this.gustKph,
        required this.uv});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = new Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_epoch'] = this.timeEpoch;
    data['time'] = this.time;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    data['is_day'] = this.isDay;
    data['condition'] = this.condition.toJson();
    data['wind_mph'] = this.windMph;
    data['wind_kph'] = this.windKph;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure_mb'] = this.pressureMb;
    data['pressure_in'] = this.pressureIn;
    data['precip_mm'] = this.precipMm;
    data['precip_in'] = this.precipIn;
    data['humidity'] = this.humidity;
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslikeC;
    data['feelslike_f'] = this.feelslikeF;
    data['windchill_c'] = this.windchillC;
    data['windchill_f'] = this.windchillF;
    data['heatindex_c'] = this.heatindexC;
    data['heatindex_f'] = this.heatindexF;
    data['dewpoint_c'] = this.dewpointC;
    data['dewpoint_f'] = this.dewpointF;
    data['will_it_rain'] = this.willItRain;
    data['chance_of_rain'] = this.chanceOfRain;
    data['will_it_snow'] = this.willItSnow;
    data['chance_of_snow'] = this.chanceOfSnow;
    data['vis_km'] = this.visKm;
    data['vis_miles'] = this.visMiles;
    data['gust_mph'] = this.gustMph;
    data['gust_kph'] = this.gustKph;
    data['uv'] = this.uv;
    return data;
  }
}
String City = '';