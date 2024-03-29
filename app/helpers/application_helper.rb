require 'net/http'
require 'uri'
require 'pygmentize'

module ApplicationHelper

  #
  # Really slow
  #
  class HTMLwithRemotePygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Net::HTTP.post_form(URI.parse('http://pygments-1-4.appspot.com/'),
                          {'lang'=>language, 'code'=>code}).body
    end
  end

  class HTMLwithPygmentizeGem < Redcarpet::Render::HTML
    def block_code(code, language)
      puts "block_code"*10
      puts language
      puts code
      Pygmentize.process(code, language.to_sym)
    end
  end

  class HTMLwithSyntaxHighlighter < Redcarpet::Render::HTML
    def block_code(code, language)
      code.gsub!('<', '$lt;')
      code.replace("<pre class='brush: #{language}'>#{code}</pre>")
    end
  end


  def markdown(text, options = nil)
    options ||= {
      :hard_wrap => true,
      :filter_html => true,
      :autolink => true,
      :strikethrough => true,
      :no_intra_emphasis => true,
      :no_styles => true,
      :fenced_code_blocks => true

    }
    puts "options?"*90
    puts options
    markdown = Redcarpet::Markdown.new(HTMLwithSyntaxHighlighter, options)
    #syntax_highlighter(markdown.render(text))
    markdown.render(text)
  end



end
