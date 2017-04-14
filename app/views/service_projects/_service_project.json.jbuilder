json.extract! service_project, :id, :name, :start_time, :end_time, :location, :host_id, :project_type, :max_volunteers, :created_at, :updated_at
json.url service_project_url(service_project, format: :json)
