module ApplicationHelper
  def mexican_states
    [
      "Aguascalientes",
      "Baja California",
      "Baja California Sur",
      "Campeche",
      "Chiapas",
      "Chihuahua",
      "Coahuila",
      "Colima",
      "Ciudad de México",
      "Durango",
      "Guanajuato",
      "Guerrero",
      "Hidalgo",
      "Jalisco",
      "México",
      "Michoacán",
      "Morelos",
      "Nayarit",
      "Nuevo León",
      "Oaxaca",
      "Puebla",
      "Querétaro",
      "Quintana Roo",
      "San Luis Potosí",
      "Sinaloa",
      "Sonora",
      "Tabasco",
      "Tamaulipas",
      "Tlaxcala",
      "Veracruz",
      "Yucatán",
      "Zacatecas"
    ]
  end

  def education_level
    [
      "Preparatoria",
      "Licenciatura",
      "Maestría",
      "Doctorado"
    ]
  end

  def referral_options
    [
      "Facebook",
      "Familiares / Amigos",
      "Empresa",
      "Universidad",
      "Otro"
    ]
  end

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
