json.extract! employee, :id, :department_id, :name, :title, :user_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
