require "book_deals/version"
require_relative "./book_deals/cli"
require_relative "./book_deals/launcher"
require_relative "./book_deals/scraper"
require_relative "./book_deals/category"
require_relative "./book_deals/book"
require_relative "./book_deals/deal"
require "colorize"
require "nokogiri"
require "open-uri"

begin
  require "pry"
rescue LoadError
  # ignore exception
end
