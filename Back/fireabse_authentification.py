import flask
import json
import pyrebase
from api_service import APIService

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
        firstname: str = user_data['firstname']
        lastname: str = user_data['lastname']

        try:
            user: dict = self.auth.create_user_with_email_and_password(email, password)
            self.auth.update_profile(display_name=firstname + ' ' + lastname, id_token=user['idToken'])

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
