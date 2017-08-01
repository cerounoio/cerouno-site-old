module ApplicationHelper
  def format_form_errors(object, attribute)
    messages = object.errors.messages[attribute.to_sym].uniq
    messages.map { |message| "#{attribute.capitalize} #{message}." }.join(' ')
  end
end
