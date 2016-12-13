json.histories @histories do |history|
  json.(history, :id, :valuation_format, :evolution_format, :format_not_pos, :user_id, :created_at)
end
