json.array!(@inspections) do |inspection|
  json.extract! inspection, :id, :name, :type, :date, :reason, :report, :conclusion, :diagnostic
  json.url inspection_url(inspection, format: :json)
end
