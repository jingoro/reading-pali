###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

activate :directory_indexes

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

with_layout 'pali' do
  page '/reading-pali/*'
end

with_layout 'chanting' do
  page "/chanting/*"
end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do

  SECTIONS = [
    [ 'home', /^\/$/ ],
    [ 'chanting', /^\/chanting\// ],
    [ 'reading-pali', /^\/reading-pali\// ],
  ]

  def page_section
    SECTIONS.each do |name, re|
      if re.match(current_page.url)
        return name
      end
    end
    'unknown'
  end

  def page_class
    "page-#{page_section}"
  end

  def pali_nav_link(n)
    if n == :home
      active = current_page.url == '/reading-pali/' ? 'active' : nil
      content_tag :li, link_to('Home', "/reading-pali/"), class: active
    else
      active = current_page.url == "/reading-pali/#{n}/" ? 'active' : nil
      content_tag :li, link_to("Lesson #{n}", "/reading-pali/#{n}/"), class: active
    end
  end

end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = 'jingoro'
  deploy.host = 'imaginary.yerk.org'
  deploy.path = '/var/www/static/ejinjue/pali'
end
