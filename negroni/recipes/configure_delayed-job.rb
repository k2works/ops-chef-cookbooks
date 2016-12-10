service "delayed-job" do
  supports :status => true, :restrart => true, :reload => true
  action [ :enable, :start ]
end
