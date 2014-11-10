module GeneralItemsHelper
  def label_and_value(label, value)
    if value.present?
      [label, value]
    end
  end

  def format_bonus(value)
    if value
      "+ #{value}"
    end
  end
end
