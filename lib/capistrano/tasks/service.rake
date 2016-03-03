namespace :service do
  desc 'Restarts remote application'
  task :restart do
    on roles(:all) do
      sudo(:service, fetch(:service_name, "#{fetch(:application)}/application"), 'restart')
    end
  end
end
