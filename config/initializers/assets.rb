# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( sessions.css )
Rails.application.config.assets.precompile += %w( homes.css )
Rails.application.config.assets.precompile += %w( collections.css )
Rails.application.config.assets.precompile += %w( saves.css )
Rails.application.config.assets.precompile += %w( groups.css )
Rails.application.config.assets.precompile += %w( collections.js)
Rails.application.config.assets.precompile += %w( groups.js )
Rails.application.config.assets.precompile += %w( homes.js )
Rails.application.config.assets.precompile += %w( notes.js )
Rails.application.config.assets.precompile += %w( notes.css )
Rails.application.config.assets.precompile += %w( saves.js )