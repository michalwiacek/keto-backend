class Tag < ActsAsTaggableOn::Tag
  # acts_as_followable #todo

  validates :text_color_hex,
            format: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/, allow_nil: true
  validates :bg_color_hex,
            format: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/, allow_nil: true
end
