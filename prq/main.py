#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
from restsrv import flaskapp
import logging

def main():
    flaskapp.run(host='0.0.0.0',port=8980,debug=True)
    
if __name__ == '__main__':
    main()
