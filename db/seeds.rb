# populate countries
CS.countries.map { |country| Country.create(name: country[1]) }
