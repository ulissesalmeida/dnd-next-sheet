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

  def format_items(items)
    safe_items = Array(items)
    safe_items.map do |item|
      item == :any ? 'One extra of your choice' : format_item(item)
    end.to_sentence
  end

  def format_item(item)
    item.to_s.humanize.titleize
  end
end
