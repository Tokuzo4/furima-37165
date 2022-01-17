crumb :root do
  link "Home", root_path
end

crumb :show do |item|
  link "Category"
  parent :root
end
