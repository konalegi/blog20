Rails.application.assets.register_engine '.haml', Tilt::HamlTemplate
Haml::Template.options[:attr_wrapper] = '"'