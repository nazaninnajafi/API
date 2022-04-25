
from jdatetime import datetime

def jdatetime(CreatedAt, format='%Y-%m-%dT%H:%M:%S.%fZ'):
    return ( datetime.fromgregorian(date=datetime.strptime(CreatedAt, format)).strftime(format))

