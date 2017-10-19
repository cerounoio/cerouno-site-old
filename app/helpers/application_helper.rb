module ApplicationHelper
  def format_status(status)
    status.gsub('_', ' ')
  end

  def format_card_time(time)
    return nil unless time

    "#{time.day} #{I18n.translate(time.strftime("%b")).upcase} #{time.year}"
  end

  def format_time(time)
    return nil unless time

    "#{time.day} de #{I18n.translate(time.strftime("%B"))} de #{time.year}"
  end

  def application_template(application)
    application.started? ? application.status : 'submitted'
  end

  def enum_options(object, enum)
    object.class.send(enum).collect { |key, value| [ I18n.translate(key.gsub('_', ' ')).capitalize, key ] }
  end

  def boolean_options
    {
      'Sí' => true,
      'No' => false
    }
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

  def professional_objective_options
    {
      "Trabajar como desarrollador de software"       => :developer,
      "Abrir una startup / empresa"                   => :startup,
      "Actualizar mi conocimiento de programación"    => :level_up,
      "Manejar a un equipo de desarrollo de software" => :manager,
      "Otro"                                          => :other
    }
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
