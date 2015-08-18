# 参考url: http://qiita.com/tachiba/items/26b2e9dc271bd8e6907d
# ============================
#  Gemfile
# ============================


gem_group :development, :test do
  gem 'pry-rails'
  # gem 'pry-doc'
  # gem 'pry-stack_explorer'
  if RUBY_VERSION >= '2.0.0'
    gem 'pry-byebug'
  else
    # 以下はRuby1.9の時のみ使う(pry-byebugの代わりに)
    # debuggerは1.9以下でしか動作しない, remote は byebug で使えないようになった
    gem 'pry-debugger'
    gem 'pry-remote'
  end
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'hirb'
  # gem 'hirb-unicode'
  # gem 'tapp'
  gem 'awesome_print'
  # gem 'quiet_assets'
  # gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
  # gem 'timecop'
  # gem 'rspec-rails'
  # gem 'guard-rspec'
  # gem 'factory_girl_rails'
  # gem 'database_rewinder'
end

# annotate models
gem 'annotate'

if yes?('Would you like to install nokogiri?')
  gem 'nokogiri'
end

if yes?('Would you like to install rspec?')
  gem_group :development, :test do
    gem "rspec-rails"
  end
end

gem 'rainbow'

# ============================
#  other
# ============================
run "bundle install --path vendor/bundle"

remove_file "public/index.html"

run 'mv README.rdoc README.md'

git :init
git add: '.'
git commit: "-a -m 'Initial Commit'"
