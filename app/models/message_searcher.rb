class MessageSearcher < Message
  include PgSearch
  multisearchable :against => [:first_name, ]
  def retrieve_relevant_messages(search_term)
    PgSearch.multisearch(search_term)
  end
end
