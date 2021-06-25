json.array! @characters do |character|
  json.extract! character, :id, :name, :house, :role, :wand, :bloodstatus
end
