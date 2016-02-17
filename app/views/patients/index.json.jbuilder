json.array!(@patients) do |patient|
  json.extract! patient, :id, :document_number, :firstname, :lastname, :observations, :inspections_id
  json.url patient_url(patient, format: :json)
end
