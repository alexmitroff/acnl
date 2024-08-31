def slice_creatures_from_section(section, page=1, per_page=18):
    start_slice = per_page * (page - 1)
    end_slice = per_page * page
    return section.creature_set.all()[start_slice:end_slice]
