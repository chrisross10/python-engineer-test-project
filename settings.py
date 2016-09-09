ENV = 'local'
_MODULE_NAME = 'settings_{env}'.format(env=ENV)
_MODULE = __import__(_MODULE_NAME)

SQL_URL = _MODULE.SQL_URL
#APP_HOST = _MODULE.APP_HOST
