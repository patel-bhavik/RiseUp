json.extract! charity, :id, :name, :cust_id, :acc_id, :balance, :created_at, :updated_at
json.url charity_url(charity, format: :json)
