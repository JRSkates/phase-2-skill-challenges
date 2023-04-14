class GrammarStats
  def initialize
    @pass_checks = 0
    @fail_checks = 0
    @total_checks = 0
  end

  def check(text) # text is a string
    fail "Not a valid sentence" if text.empty? or text.nil?
    @total_checks += 1
    first_letter_is_capital = text[0] == text[0].upcase
    last_char_is_valid = [".", "?", "!"].include?(text[-1])
    if first_letter_is_capital && last_char_is_valid
      @pass_checks += 1
      true
    else
      @fail_checks += 1
      false
    end
  end

  def percentage_good
    if @pass_checks == 0 && @fail_checks > 0
      return 0
    elsif @fail_checks == 0 && @pass_checks > 0
      return 100
    else
      ((@pass_checks.to_f / @total_checks.to_f) * 100).to_i
    end
  end
end