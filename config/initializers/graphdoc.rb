GraphdocRuby.configure do |config|
  config.endpoint = Rails.root.join('tmp', 'graphql', 'schema.json')
  config.output_directory = Rails.root.join('tmp', 'graphdoc').to_s
  config.schema_name = 'KetoBackendSchema'
  config.run_time_generation = Rails.env.development?
end