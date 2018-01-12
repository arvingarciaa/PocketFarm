from urllib.request import urlopen
import json
f = urlopen('http://api.wunderground.com/api/5dbc6b15e1547ebc/conditions/pws:1/q/pws:ICALABAR18.json')
json_string = f.read()
parsed_json = json.loads(json_string)
location = parsed_json['current_observation']['observation_location']['city']
temp_f = parsed_json['current_observation']['temp_c']
print ('Current temperature in %s is: %s' % (location, temp_f))
f.close()
