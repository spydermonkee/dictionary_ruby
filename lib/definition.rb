class Definition
  attr_reader :definition, :language

  def initialize(definition, language)
    @language = language
    @definition = definition
  end

  def change_definition(new_definition)
    @definition = new_definition
  end
end
