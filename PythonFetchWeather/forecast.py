from urllib.request import urlopen
import json
f = urlopen('http://api.wunderground.com/api/5dbc6b15e1547ebc/conditions/pws:1/q/pws:ICALABAR18.json')
json_string = f.read()
parsed_json = json.loads(json_string)
location = parsed_json['current_observation']['observation_location']['city']
print ('%s' % (location))
f.close()

f = urlopen('http://api.wunderground.com/api/5dbc6b15e1547ebc/forecast/pws:1/q/pws:ICALABAR18.json')
json_string = f.read()
parsed_json = json.loads(json_string)
day = parsed_json['forecast']['txt_forecast']['forecastday'][2]['title']
forecast = parsed_json['forecast']['txt_forecast']['forecastday'][2]['fcttext_metric']
print('Weather forecast for %s: %s' % (day, forecast))
f.close()