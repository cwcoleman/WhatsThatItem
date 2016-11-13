#!/usr/bin/env python

# modules we'll need:
import os
import requests
import json
from bottle import get, post, route, run, request, template, static_file
from copy import deepcopy
from global_data import inventory

# Read our port:
PORT = int(os.getenv('PORT', 8000))

print inventory


@route('/hello/<name>')
def index(name):
    return template('<b>Hello {{name}}</b>!', name=name)


@get('/')
def landing_page():
    return template('landing_page')


@post('/')
def do_landing_page_search():

    picture = request.files.get('images_file')
    print str(picture)

    barcode = request.files.get('barcode')
    print str(barcode)

    text_name = request.forms.get('part_name')
    print str(text_name)

    name, ext = os.path.splitext(picture.filename)

    url = "https://gateway-a.watsonplatform.net/visual-recognition/api/v3/classify"

    # querystring = {"api_key": "06ef68118733853b78596ea98121b51b469af153", "version": "2016-05-20",
    #               "classifier_ids": "PipeFittings_38123805"}

    # payload = "-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"images_file\"; filename=\"2016-11-12 20.37.58.jpg\"\r\nContent-Type: image/jpeg\r\n\r\n\r\n-----011000010111000001101001--"
    # headers = {
    #    'content-type': "multipart/form-data; boundary=---011000010111000001101001",
    #    'cache-control': "no-cache"
    # }
    # image_metadata = picture.headers.dict
    # image_data = json.dumps(image_metadata)

    # headers = {'Content-Type': "multipart/form-data", 'Accept-Language': 'en', 'Cache-Control': 'no-cache'}
    # headers = {'Accept-Language': 'en', 'Cache-Control': 'no-cache'}
    # payload = 'Content-Disposition: form-data;'
    # payload += 'name=\"images_file\"; filename=\"%s\"\r\nContent-Type: image/jpeg\r\n\r\n' % str(picture.filename)

    querystring = {"api_key": "06ef68118733853b78596ea98121b51b469af153", "version": "2016-05-20",
                   "classifier_ids": "PipeFittings_38123805"}

    payload = "-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"images_file\"; filename=\"unknown1.jpg\"\r\nContent-Type: image/jpeg\r\n\r\n\r\n-----011000010111000001101001--"
    headers = {
        'Content-Disposition': 'form-data; name=\"images_file\"; filename=\"unknown1.jpg\"',
        'Content-Type': 'image/jpeg',
        'cache-control': "no-cache"
    }

    files = {'images_file': picture.file}
    # payload = {'name': str(picture.filename),'data': image_data}

    try:
        #response = requests.request("POST", url, data=payload, headers=headers, params=querystring, files=files)
        response = requests.post(url=url, params=querystring, headers=headers, files=files)
        # response = requests.request("POST", url, data=payload, headers=headers, params=querystring, files=picture.file)

    except Exception, e:
        print "OPS!! %r" % str(e)

    print(response.text)

    results = deepcopy(inventory)

    output = template('search_results', search_results=results)

    return output


@route('/images/<pic>')
def images(pic):
    return static_file(pic, root='./images')


@route('/search_result')
def search_results():

    results = deepcopy(inventory)

    output = template('search_results', search_results=results)

    return output

run(host='0.0.0.0', port=PORT, debug=True)
