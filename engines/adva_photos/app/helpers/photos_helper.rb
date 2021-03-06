module PhotosHelper
  def collection_title(set=nil, tags=nil)
    title = []
    title << t('adva.photos.titles.about', :title => set.title) if set
    title << t('adva.photos.titles.tagged', :tags => tags.to_sentence) if tags
    title.present? ? t('adva.photos.titles.photos_xxx', :photos_list => title.join(', ') ) : t('adva.photos.titles.default')
  end

  def link_to_set(*args)
    text = args.shift if args.first.is_a? String
    set = args.pop
    section = args.pop || set.section
    link_to text || set.title, album_set_path(section, set)
  end

  def links_to_photo_sets(photo, key = nil)
    return if photo.sets.empty?
    links = photo.sets.map{|set| link_to_set photo.section, set }
    key ? ("#{key} " + links.join(', ')) : links
  end
end
