module PlayersHelper
  def convert_number_string_to_percentage(num_str)
    num = num_str.to_f
    number_to_percentage(num * 100, precision: 1)
  end
end
