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


def slice_creatures_from_section(section, page=1, per_page=18):
    start_slice = per_page * (page - 1)
    end_slice = per_page * page
    return section.creature_set.all()[start_slice:end_slice]