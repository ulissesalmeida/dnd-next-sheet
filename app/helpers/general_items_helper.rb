module GeneralItemsHelper
  def label_and_value(label, value)
    if value.present?
      [label, value]
    end
  end
end
