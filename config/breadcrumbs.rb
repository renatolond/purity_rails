crumb :root do
  link "Home", root_path
end

crumb :test do |test|
  link test.name, test_path(test)
end

crumb :group do |group|
  link group.headline, group_path(group)
  parent :test, group.test
end
