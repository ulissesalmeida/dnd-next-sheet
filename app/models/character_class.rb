class CharacterClass
  class << self
    def all
      ALL_CLASSES
    end

    def find_by_slug(slug)
      ALL_CLASSES_BY_SLUG[slug.to_s]
    end
  end

  ALL_CLASSES = Repository.load('character_classes')
  ALL_CLASSES_BY_SLUG = ALL_CLASSES.index_by { |characer_class| characer_class[:slug].to_s }
end
