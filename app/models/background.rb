class Background
  class << self
    def all
      ALL_BACKGROUNDS
    end

    def find_by_slug(slug)
      ALL_BACKGROUNDS_BY_SLUG[slug.to_s]
    end
  end

  ALL_BACKGROUNDS = Repository.load(:backgrounds)
  ALL_BACKGROUNDS_BY_SLUG = ALL_BACKGROUNDS.index_by { |background| background[:slug].to_s }
end
