module BooksHelper
  def link_to_publication(publication, options={})
    title = publication.title || publication.original_title || t('publication.message.title_unknown')
    link_to "#{title}", publication, options
  end
end
