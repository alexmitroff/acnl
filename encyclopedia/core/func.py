import datetime


def get_month():
    d = datetime.datetime.now()
    m = d.strftime("%B")
    return m


def get_current_month_name():
    d = datetime.datetime.now()
    return d.strftime("%B")


def get_current_month_number():
    d = datetime.datetime.now()
    return d.month
