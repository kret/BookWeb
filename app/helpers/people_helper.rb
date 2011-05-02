module PeopleHelper
  def link_to_person(person, options={})
    link_to "#{person.first_name} #{person.last_name}", person, options
  end
end
