class Repository
  def self.load(resource_collection_name)
    repository = new(resource_collection_name)

    repository.resources
  end

  def initialize(resource_collection_name)
    @resource_collection_name = resource_collection_name
  end

  def resources
    directory.each_child.map(&method(:load_yaml))
  end

  private

  def directory
    @directory ||= Rails.root.join('config', 'seeds', @resource_collection_name.to_s)
  end

  def load_yaml(entry)
    YAML.load_file(directory.join(entry)).with_indifferent_access
  end
end
