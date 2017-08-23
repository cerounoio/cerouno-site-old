module ApplicationHelper
  def gender_options
    Demographic.genders.collect { |key, value| [ I18n.translate(key).capitalize, key ] }
  end

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

  def professional_objectives
    [
      "Trabajar como desarrollador de software",
      "Abrir una startup / empresa",
      "Actualizar mi conocimiento de programación",
      "Aprender a manejar un equipo de desarrollo de software"
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

  def format_steps(steps)
    return I18n.translate('none').capitalize if steps.empty?

    steps.map { |step| I18n.translate(step) }.join(', ').capitalize
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
