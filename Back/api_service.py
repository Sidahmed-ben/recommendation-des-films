from flask import Flask, jsonify
import json

class APIService:
    def __init__(self, app: Flask):
        self.app = app

    def response_api(self, content: dict, code: int) -> json:
        return jsonify(content), code
