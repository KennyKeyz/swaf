json.extract! report, :id, :name, :date_from, :date_to, :created_at, :updated_at
json.url report_url(report, format: :json)
