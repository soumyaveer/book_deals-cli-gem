module BookDeals
  class Scraper

    HOME_URL = "https://www.goodreads.com"
    BOOK_DEALS_URL = HOME_URL + "/ebook-deals"
    HOME_PAGE_HTML_ELEMENTS = ".gr-dealsCategoryExplorer .u-unstyledListItem li a"
    CATEGORY_PAGE_HTML_ELEMENTS = ".gr-deals .visibleWide .gr-dealsList__listItem"
    DEALS_HTML_ELEMENT_TITLE = ".gr-book__title"
    DEALS_HTML_ELEMENT_AUTHOR = ".gr-book__author a"
    DEALS_HTML_ELEMENT_CATEGORIES = ".gr-deal__tag"
    DEALS_HTML_ELEMENT_DESCRIPTION = ".gr-deal__blurb"
    DEALS_HTML_ELEMENT_DEAL_PRICE = ".gr-deal__price__deal"
    DEALS_HTML_ELEMENT_ORIGINAL_PRICE = ".gr-deal__price__original strike"
    DEALS_HTML_ELEMENT_DATETIME = ".gr-deal__expirationDate"

    def get_page
      Nokogiri::HTML(open(BOOK_DEALS_URL))
    end

    def scrape_categories_from_home_page
      all_category_html_elements = self.get_page.css(HOME_PAGE_HTML_ELEMENTS)
      category_html_elements = select_public_category_html_elements(all_category_html_elements)

      category_html_elements.map do |html_element|
        category_name = html_element.text
        category_url = HOME_URL + html_element.attr("href")
        Category.new(category_name, category_url)
      end
    end

    def scrape_deals_from_category_page(category)
      deals_html_doc = Nokogiri::HTML(open(category.url))
      deals_html_elements = deals_html_doc.css(CATEGORY_PAGE_HTML_ELEMENTS)

      deals_html_elements.each do |html_element|
      end
      category
    end

    private

    def select_public_category_html_elements(all_category_html_elements)
      all_category_html_elements.reject {|html_element| html_element.text == "Recommended for You"}
    end
  end
end
