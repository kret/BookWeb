module BooksHelper
  def link_to_publication(publication, options={})
    publication = publication.publication if publication.is_a? Edition
    title = publication.title || publication.original_title || t('publication.message.title_unknown')
    link_to title, publication, options
  end
end
