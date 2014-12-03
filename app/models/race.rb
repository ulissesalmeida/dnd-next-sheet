class Race
  class << self
    def all
      ALL_RACES
    end

    def find_by_slug(slug)
      ALL_RACES_BY_SLUG[slug]
    end

    def find_variant_by_slug(race_slug, variant_slug)
      race = find_by_slug(race_slug)
      if race
        race[:race_variants].find { |variant| variant[:slug] == variant_slug }
      end
    end
  end

  ALL_RACES = Repository.load('races')
  ALL_RACES_BY_SLUG = ALL_RACES.index_by { |race| race[:slug] }
end
