import requests
import csv
import json
import socket
import sys
from pprint import pprint

print("Running on node: %s" % socket.getfqdn())

def create_data(option_list_info, csvdata):
    jsonout = option_list_info
    jsonout['optionTypeList']['initialDataset'] = csvdata
    return json.dumps(jsonout)

morpheus_url = morpheus['morpheus']['applianceUrl']
if not sys.argv[1]:
    print("Need token as argument")
    quit(1)
token = sys.argv[1]
morpheus_api = morpheus_url + "api"

option_list_name = morpheus['customOptions']['ot_update_olname']
print("Option List Name: %s" % option_list_name)
option_list_description = morpheus['customOptions']['ot_update_oldescription']
print("Option List Description: %s" % option_list_description)

option_list_info = {
    "optionTypeList": {
        "name": option_list_name,
        "description": option_list_description,
        "type": "manual"
    }
}

csv_filename = str(morpheus['customOptions']['ot_update_csv_filename']).replace("'", "")
print("CSV filename: %s" % csv_filename)
csv_big_string = ""

with open(csv_filename) as f:
    payload = create_data(option_list_info, f.read())

sslverify = True
method = "post"
headers = {'Authorization': "BEARER %s" % token, "Content-Type": "application/json"}
url = morpheus_api + "/library/option-type-lists"
get_url = morpheus_api + "/library/option-type-lists?name=%s" % option_list_name

get_list_id_r = getattr(requests, "get")(
    get_url,
    headers=headers,
    verify=sslverify
)
get_response = json.loads(get_list_id_r.text)

if 'meta' not in get_response:
    pprint(get_response)

if get_response['meta']['total'] > 0:
    method = "put"
    url = url + "/%s" % get_response['optionTypeLists'][0]['id']

r = getattr(requests, method)(
    url,
    headers=headers,
    verify=sslverify,
    data=payload
    )
