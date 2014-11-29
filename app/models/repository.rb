class Repository
  YAML_REGEX = /(.*)\.yml\z/

  def self.load(resource_collection_name)
    repository = Repository.new(resource_collection_name)

    repository.resources
  end

  def initialize(resource_collection_name)
    @resource_collection_name = resource_collection_name
  end

  def resources
    Dir.entries(directory).map do |entry|
      if entry =~ YAML_REGEX
        ActiveSupport::HashWithIndifferentAccess.new(load_yaml(entry))
      end
    end.reject(&:nil?)
  end

  private

  def directory
    @directory ||= Rails.root.join('config', 'seeds', @resource_collection_name.to_s)
  end

  def load_yaml(entry)
    YAML.load_file(directory.join(entry))
  end
end
