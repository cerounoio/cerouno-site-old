module ApplicationHelper
  def format_form_errors(object, attribute)
    messages = object.errors.messages[attribute.to_sym].uniq
    messages.map { |message| format_error_message(attribute, message) }.join(' ')
  end

  private

  def format_error_message(attribute, message)
    attribute = I18n.translate(attribute.to_s.gsub('_', ' '))
    "#{attribute} #{message}.".capitalize
  end
end
