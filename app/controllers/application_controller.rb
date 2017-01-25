class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_basic_meta_tags

  private

  def set_basic_meta_tags
    @company_name_for_title = 'odd'
    @site_name = "#{@company_name_for_title}"
    set_meta_tags site: @site_name,
                  # reverse: true,
                  separator: '::',
                  keywords: 'odd',
                  icon: [
                    { href: '/favicon.png',
                      type: 'image/png' },
                    { href: '/apple-touch-icon-76x76-precomposed.png',
                      rel: 'apple-touch-icon-precomposed',
                      sizes: '76x76',
                      type: 'image/png' },
                    { href: '/apple-touch-icon-72x72-precomposed.png',
                      rel: 'apple-touch-icon-precomposed',
                      sizes: '72x72',
                      type: 'image/png' },
                    { href: '/apple-touch-icon-60x60-precomposed.png',
                      rel: 'apple-touch-icon-precomposed',
                      sizes: '60x60',
                      type: 'image/png' },
                    { href: '/apple-touch-icon-57x57-precomposed.png',
                      rel: 'apple-touch-icon-precomposed',
                      sizes: '57x57',
                      type: 'image/png' },
                    { href: '/apple-touch-icon-152x152-precomposed.png',
                      rel: 'apple-touch-icon-precomposed',
                      sizes: '152x152',
                      type: 'image/png' },
                    { href: '/apple-touch-icon-144x144-precomposed.png',
                      rel: 'apple-touch-icon-precomposed',
                      sizes: '144x144',
                      type: 'image/png' },
                    { href: '/apple-touch-icon-120x120-precomposed.png',
                      rel: 'apple-touch-icon-precomposed',
                      sizes: '120x120',
                      type: 'image/png' },
                    { href: '/apple-touch-icon-114x114-precomposed.png',
                      rel: 'apple-touch-icon-precomposed',
                      sizes: '114x114',
                      type: 'image/png' }
                  ],
                  og: {
                    site_name: @site_name,
                    type: 'website',
                    locale: 'zh_TW'
                  }
  end

  def load_meta_tags_format(args = {})
    title = args.fetch(:title, '')
    description = args.fetch(:description, 'we are professional in Rails')
    og_image = args.fetch(:og_image, view_context.asset_url('og_image.jpg'))

    set_meta_tags title: title,
                  description: description,
                  og: {
                    description: description,
                    image: og_image
                  }
  end
    
end
