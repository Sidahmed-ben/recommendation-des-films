import flask
import json
from controllers.dbController import createUserDB
import pyrebase
from api_service import APIService
from app import db


class FirebaseAuthentification:
    def __init__(self, app: flask.Flask, firebase: pyrebase):
        self.app = app
        self.auth = firebase.auth()
        self.api_service = APIService(app)
        self.auth_blueprint = flask.Blueprint('auth', __name__)
        self.init_routes()
        self.app.register_blueprint(self.auth_blueprint)

    def init_routes(self) -> None:
        self.auth_blueprint.route('/login', methods=['POST'])(self.login)
        self.auth_blueprint.route('/register', methods=['POST'])(self.register)

    def register(self) -> json:
        user_data: dict = flask.request.get_json()

        email: str = user_data['email']
        password: str = user_data['password']
        first_name: str = user_data['firstName']
        last_name: str = user_data['lastName']

        try:
            user: dict = self.auth.create_user_with_email_and_password(email, password)
            self.auth.update_profile(display_name=first_name + ' ' + last_name, id_token=user['idToken'])

            # Add user to database
            #  TO TEST
            username = firstname+" "+lastname
            createUserDB(db,user,username,email)
            #//////////////////////////////// 
            content: dict = {
                'success': True,
                'user': user
            }
            code: int = 200
        except Exception as e:
            content: dict = {
                'success': False,
                'message': 'Erreur lors de la création du compte avec l\'email ' + email,
                'error': str(e),
            }
            code: int = 403

        return self.api_service.response_api(content, code)

    def login(self) -> json:
        user_data: dict = flask.request.get_json()

        email: str = user_data['email']
        password: str = user_data['password']

        try:
            auth_user: dict = self.auth.sign_in_with_email_and_password(email, password)

            response: dict = {
                'user': auth_user,
                'success': True
            }
            code: int = 200
        except Exception as e:
            response: dict = {
                'message': 'Échec de l\'authentification',
                'error': 'Échec de l\'authentification : ' + str(e),
                'success': False
            }
            code: int = 401

        return self.api_service.response_api(response, code)
