class Race
  class << self
    def all
      ALL_RACES
    end

    def find_by_slug(slug)
      ALL_RACES_BY_SLUG[slug]
    end

    def find_variant_by_slug(race_slug, variant_slug)
      ALL_RACES_BY_SLUG[race_slug][:race_variants].find { |variant| variant[:slug] == variant_slug }
    end
  end

  ALL_RACES = Repository.load('races')
  ALL_RACES_BY_SLUG = ALL_RACES.index_by { |race| race[:slug] }
end
