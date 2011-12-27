require 'net/http'
require 'uri'

module ApplicationHelper

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Net::HTTP.post_form(URI.parse('http://pygments-1-4.appspot.com/'),
                                      {'lang'=>pre[:lang], 'code'=>pre.text.strip}).body
    end
    doc.css('body > *').to_s
  end

  def markdown(text, options = {})
    options ||= {
      :hard_wrap => true,
      :filter_html => true,
      :autolink => true,
      :no_intraemphasis => true,
      :fenced_code => true,
      :gh_blockcode => true,
    }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    syntax_highlighter(markdown.render(text)).html_safe
  end
end
