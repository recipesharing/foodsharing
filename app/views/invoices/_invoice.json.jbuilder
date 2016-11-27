json.extract! invoice, :id, :amount, :currency, :date, :reference, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)