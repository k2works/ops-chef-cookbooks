bash "stop delayed-job" do
  code <<-EOC
    initctl stop delayed-job
  EOC
end
