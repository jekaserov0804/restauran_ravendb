class Section
  attr_accessor :id, :name

  def initialize(name = '')
    @id = "Section_#{SecureRandom.uuid}"
    @name = name
  end

  def serialize
    {
      id: id,
      name: name
    }
  end
end