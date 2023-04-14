class Gratitudes
  def initialize
    @gratitudes = []
  end

  def add(gratitude)
    @gratitudes << gratitude
  end

  def format
    prefix = "Be grateful for: "
    gratitude_list = @gratitudes.join(", ")
    return "#{prefix}#{gratitude_list}"
  end
end