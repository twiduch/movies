%w[
  Amy
  Bob
  Maria
].each do |name|
  User.find_or_create_by(name: name)
end
